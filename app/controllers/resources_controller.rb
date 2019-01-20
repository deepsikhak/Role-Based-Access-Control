class ResourcesController < ApplicationController
    skip_before_action :verify_authenticity_token 


    def create
        resource = Resource.create(resource_params)
        if resource.save 
          render json: {"success": true, "message": "Resource created"}
        else
          error ||= user.errors.full_messages.to_s
          render json: {"success": false, "message": error}, status: :unprocessable_entity
        end
    end

    def show
        begin 
            resource = Resource.find(params[:id])
            render json: resource.as_json(except: [:created_at,:updated_at])
        rescue Exception => e
            render json: {"success": false,"message":"Resource doesnt exist"}
        end
    end

    # def update
    #     user= User.find(params[:id])
    #     user.update_attribute(:name,params[:name]) #Only Updating name attribute for now
    #     if user.save
    #         render json: {"success": true, "message": "User name updated"}
    #     else
    #         render json: {"success": false, "message": "Couldnt be updated"}
    #     end
    # end

    def destroy
        resource= Resource.find(params[:id]).destroy
        if resource.destroy
            render json: {"success": true, "message": "Resource deleted"}
        else
            render json: {"success": false, "message": "Couldnt be deleted"}
        end
    end

    private

    def resource_params
        params.require(:resource).permit(:name)
    end
end
