class ChangeTablesDataTypes < ActiveRecord::Migration[5.2]
  def change
    change_column :restaurants, :name, :string
    change_column :restaurants, :type, :string
    change_column :restaurants, :address, :string
    change_column :reviews, :content, :text
  end
end
