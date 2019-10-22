class ChangeReservationsColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :date, :date
    change_column :reservations, :time, :datetime
  end
end
