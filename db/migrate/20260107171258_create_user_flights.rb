class CreateUserFlights < ActiveRecord::Migration[8.1]
  def change
    create_table :user_flights do |t|
      t.belongs_to :user, null: false
      t.belongs_to :flight, null: false

      t.timestamps
    end
  end
end
