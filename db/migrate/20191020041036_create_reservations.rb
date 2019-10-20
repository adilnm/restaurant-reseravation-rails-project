class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :date
      t.time :time
      t.integer :number_of_people
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
