class DashboardController < ApplicationController
  def index
    vehicles = Vehicle.eager_load(:positions)
    vehicle_with_most_recent_positiones = build_vehicle_with_most_recent_positiones_array(vehicles)
    # set gon variable
    gon.vehicle_with_most_recent_positiones = vehicle_with_most_recent_positiones
  end

  private

  def build_vehicle_with_most_recent_positiones_array(vehicles)
    vehicles.map do |vehicle|
      {
        name: vehicle.identifier,
        positions: build_positions_array(vehicle.positions.most_recent)
      }
    end
  end

  def build_positions_array(most_recent_positions)
    most_recent_positions.map do |position|
      {
        latitude: position.latitude,
        longitude: position.longitude,
        sent_at: position.sent_at
      }
    end
  end
end