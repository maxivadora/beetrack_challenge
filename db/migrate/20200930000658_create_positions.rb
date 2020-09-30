class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.datetime :sent_at
      t.string :vehicle_identifier

      t.timestamps
    end
    add_index :positions, :vehicle_identifier
  end
end
