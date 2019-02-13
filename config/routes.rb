Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users, only: [:create, :show, :update, :destroy] do
    collection do
      get :all_resources
    end
  end
  resource :roles, only: [:create, :show, :update, :destroy]
  resource :resources, only: [:create, :show, :destroy]
  resource :role_users, only: [:create, :destroy] do
    collection do
      get :all_users
      get :all_roles
    end
  end
  resource :permissions, only: [:create, :destroy] do
    collection do
      get :all_resources
    end
  end

end

