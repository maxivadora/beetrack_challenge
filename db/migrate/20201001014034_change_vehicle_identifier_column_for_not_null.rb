class ChangeVehicleIdentifierColumnForNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column :positions, :vehicle_identifier, :string, null: false
  end
end
