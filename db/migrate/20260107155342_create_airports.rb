class CreateAirports < ActiveRecord::Migration[8.1]
  def change
    create_table :airports do |t|
      t.string :location

      t.timestamps
    end
  end
end
