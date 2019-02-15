ActiveAdmin.register User do
    permit_params :name, :phone, :created_at, :updated_at 
    filter :name
    filter :phone
    filter :created_at
    filter :updated_at
  
    
    index do
        column :id do |user|
            best_in_place user, :id, as: :input, url: [:admin,user]
        end
        column :name do |user|
            best_in_place user, :name, as: :input, url: [:admin,user]
        end
        column :phone do |user|
            best_in_place user, :phone, as: :input, url: [:admin,user]
        end
        column :created_at do |user|
            best_in_place user, :created_at, as: :input, url: [:admin,user]
        end
        column :updated_at do |user|
            best_in_place user, :updated_at, as: :input, url: [:admin,user]
        end
        actions
    end
  end