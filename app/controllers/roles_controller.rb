class RolesController < ApplicationController
    skip_before_action :verify_authenticity_token 


    def create
        role = Role.create(roles_params)
        if role.save 
          render json: {"success": true, "message": "Roles created"}
        else
          error ||= user.errors.full_messages.to_s
          render json: {"success": false, "message": error}, status: :unprocessable_entity
        end
    end

    def show
        begin 
            roles = Role.find(params[:id])
            render json: roles.as_json(except: [:created_at,:updated_at])
        rescue Exception => e
            render json: {"success": false,"message":"Role doesnt exist"}
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
        role= Role.find(params[:id]).destroy
        if role.destroy
            render json: {"success": true, "message": "Role deleted"}
        else
            render json: {"success": false, "message": "Couldnt be deleted"}
        end
    end

    private

    def roles_params
        params.require(:roles).permit(:designation)
    end

end

