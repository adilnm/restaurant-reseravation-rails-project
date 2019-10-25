class AddaCitycolumn < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :city, :string
    add_column :restaurants, :rating, :integer
    rename_column :restaurants, :category, :cuisine
  end
end
