class ChangeColumnUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :is_deleted, :boolean, default: false
  end
end
