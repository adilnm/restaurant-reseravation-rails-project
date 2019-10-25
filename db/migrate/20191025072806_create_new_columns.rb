class CreateNewColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :new_columns do |t|
      remove_column :restaurants, :city
      change_column :restaurants, :rating, :decimal
      add_column :restaurants, :phone_number, :string
    end
  end
end
