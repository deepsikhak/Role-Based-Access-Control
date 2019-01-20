class ApplicationController < ActionController::Base
    # before_action :set_token!


    # def set_token!
    #     if request.authorization.present?
    #       token = request.authorization
    #       @current_user = User.find_by(token: token)
    #     end
    #     @current_user = User.create(token: User.generate_token) unless @current_user.present?
    #     RequestStore.store[:user] = @current_user
    #     response.headers['HTTP_AUTHORIZATION'] = "#{@current_user.token}"
    # end
end
