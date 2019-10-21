class RenameColumnType < ActiveRecord::Migration[5.2]
  def change
    rename_column :restaurants, :type, :category
  end
end
