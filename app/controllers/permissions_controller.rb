class PermissionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        object = Permission.create!(permission_params)
        if object.save
            render json: {"success": true, "message": "successfully created"}
        else
            render json: {"success": false, "message": "action_id or role_id or resource_id doesnt exist"}
        end
    end

    def all_resources
        begin 
            object = Permission.where(:role_id=>params[:role_id])
            resources=[]
            object.each do |i|
                resources<<Resource.find(i[:resource_id]).name
            end
            render json: {"data":resources}
        rescue Exception => e
            render json: {"success": false,"message":"resources with this role doesnt exist"}
        end
    end

    def destroy
        object= Permission.find(params[:id]).destroy
        if object.destroy
            render json: {"success": true, "message": "successfully deleted"}
        else
            render json: {"success": false, "message": "Couldnt be deleted"}
        end
    end

    private

    def permission_params
        params.require(:details).permit(:role_id, :action_id, :resource_id)
    end

end
