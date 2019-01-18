class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.integer :role_id
      t.integer :action_id
      t.integer :resource_id

      t.timestamps
    end
  end
end
