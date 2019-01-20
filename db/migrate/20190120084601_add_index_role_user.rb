class AddIndexRoleUser < ActiveRecord::Migration[5.2]
  def change
    add_index :role_users, [:user_id, :role_id], unique: true
  end
end
