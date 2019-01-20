class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token 

    def create
        user = User.create(auth_params)
        if user.save 
          @current_user = user
          render json: {"success": true, "message": "User created"}
        else
          error ||= user.errors.full_messages.to_s
          render json: {"success": false, "message": error}, status: :unprocessable_entity
        end
    end

    def all_resources
        roles=RoleUser.where(:user_id=>params[:id])
        permissions = []
        resources = []
        roles.each do |r|
            role_id = r.role.id
            permissions << Permission.where(:role_id=>role_id)
        end
        permissions = permissions.flatten
        permissions.each do |res|
            res_name = res.resource.name
            res_action = res.action.name
            resources << {name: res_name, action: res_action}
        end
        render json: {"success": true,"resources":resources}
    end

    def show
        begin 
            user = User.find(params[:id])
            render json: user.as_json(except: [:created_at,:updated_at])
        rescue Exception => e
            render json: {"success": false,"message":"User doesnt exist"}
        end
    end

    def update
        user= User.find(params[:id])
        user.update_attribute(:name,params[:name]) #Only Updating name attribute for now
        if user.save
            render json: {"success": true, "message": "User name updated"}
        else
            render json: {"success": false, "message": "Couldnt be updated"}
        end
    end

    def destroy
        user= User.find(params[:id]).destroy
        if user.destroy
            render json: {"success": true, "message": "User deleted"}
        else
            render json: {"success": false, "message": "Couldnt be deleted"}
        end
    end


    private

    def auth_params
        params.require(:user).permit(:name, :phone)
    end
end

