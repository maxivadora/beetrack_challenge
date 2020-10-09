class CreatePositionService
  def initialize(params)
    @params = params.with_indifferent_access
  end

  def perform
    can_find_or_create_vehicle? && Position.create(@params)
  end

  private

  def can_find_or_create_vehicle?
    return false if @params[:vehicle_identifier].nil?

    Vehicle.where(identifier: @params[:vehicle_identifier]).first_or_create
  end
end