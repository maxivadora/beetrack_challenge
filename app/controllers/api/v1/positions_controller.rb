module API::V1
  class PositionsController < BaseController
    def create
      if are_the_params_present?
        CreatePositionJob.perform_later(position_params)
        render_success(message: 'Position created!.')
      else
        render_error(errors: 'Missing params', status_code: :unprocessable_entity)
      end
    end

    private

    def position_params
      params.require(:position).permit(:latitude, :longitude, :sent_at, :vehicle_identifier)
    end

    def are_the_params_present?
      true unless position_params[:latitude].blank? || position_params[:longitude].blank? || position_params[:sent_at].blank?
    end
  end
end
