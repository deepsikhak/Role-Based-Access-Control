class RenameColumnResource < ActiveRecord::Migration[5.2]
  def change
    rename_column :resources, :type, :name
  end
end
