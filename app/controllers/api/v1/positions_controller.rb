module API::V1
  class PositionsController < BaseController
    def create
      position = Position.new(position_params)

      if position.valid?
        CreatePositionJob.perform_later(position_params)
        render_success(message: 'Position created!.')
      else
        render_error(errors: position.errors, status_code: :unprocessable_entity)
      end
    end

    private

    def position_params
      params.require(:position).permit(:latitude, :longitude, :sent_at, :vehicle_identifier)
    end
  end
end
