class CreatePositionService
  def initialize(params)
    @params = params.with_indifferent_access
  end

  def perform
    return true if can_find_or_create_vehicle? && Position.create(@params)
  end

  private

  def can_find_or_create_vehicle?
    return false if @params[:vehicle_identifier].nil?

    vehicle = Vehicle.where(identifier: @params[:vehicle_identifier]).first_or_create
  end
end