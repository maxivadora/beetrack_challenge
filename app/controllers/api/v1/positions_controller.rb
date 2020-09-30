module API::V1
  class PositionsController < BaseController
    def create
      vehicle = Vehicle.find_or_create_by(identifier: position_params[:vehicle_identifier])
      position = vehicle.positions.new(position_params)
      render_success(message: 'Position created')
    end

    private

    def position_params
      params.require(:position).permit(:latitude, :longitude, :sent_at, :vehicle_identifier)
    end
  end
end
