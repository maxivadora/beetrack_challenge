class AddIndexToVehicleIdentifier < ActiveRecord::Migration[6.0]
  def change
    add_index :vehicles, :identifier, unique: true
  end
end
