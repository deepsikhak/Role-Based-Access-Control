class AddIndexPermission < ActiveRecord::Migration[5.2]
  def change
    add_index :permissions, [:role_id, :action_id, :resource_id], unique: true
  end
end
