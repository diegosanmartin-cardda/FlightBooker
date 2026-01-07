class CreateUserFlights < ActiveRecord::Migration[8.1]
  def change
    create_table :user_flights do |t|
      t.references :passenger, null: false
      t.references :passenger_flight, null: false

      t.timestamps
    end
  end
end
