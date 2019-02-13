ActiveAdmin.register User do
    permit_params :name, :phone, :created_at, :updated_at 
    filter :name
    filter :phone
    filter :created_at
    filter :updated_at
  
    index do
      column :id
      column :name
      column :phone
      column :created_at
      column :updated_at
      actions
    end
  end