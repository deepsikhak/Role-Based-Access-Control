class RoleUsersController < ApplicationController
    skip_before_action :verify_authenticity_token


    def create
        begin 
            object = RoleUser.create(role_user_params)
            if object.save
                render json: {"success": true, "message": "successfully created"}
            else
                render json: {"success": false, "message": "user or role doesnt exist"}
            end
        rescue Exception => e
          render json: {"success": false, "message": e.message}, status: :unprocessable_entity
        end
    end

    def all_users
        begin 
            objects = RoleUser.where(:role_id=>params[:role_id])
            users=[]
            objects.each do |i|
                users<<User.find(i[:user_id]).name
            end
            render json: {"data": users}
        rescue Exception => e
            render json: {"success": false,"message":"user with this role doesnt exist"}
        end
    end

    def all_roles
        begin 
            objects = RoleUser.where(:user_id=>params[:user_id])
            roles=[]
            objects.each do |i|
                roles<<Role.find(i[:role_id]).designation
            end
            render json: {"data": roles}
        rescue Exception => e
            render json: {"success": false,"message":"this user roles doesnt exist"}
        end
    end

    def destroy
        object= RoleUser.find(params[:id]).destroy
        if object.destroy
            render json: {"success": true, "message": "successfully deleted"}
        else
            render json: {"success": false, "message": "Couldnt be deleted"}
        end
    end

    private

    def role_user_params
        params.require(:details).permit(:user_id,:role_id)
    end

end
