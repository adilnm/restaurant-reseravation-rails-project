class ChangeDateColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :date, :datetime
  end
end
