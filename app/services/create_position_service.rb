class CreatePositionService
  def initialize(params)
    @params = params.with_indifferent_access
  end

  def perform
    return false unless can_find_or_create_vehicle?

    return false unless Position.create(@params)
    
    true
  end

  private

  def can_find_or_create_vehicle?
    vehicle = Vehicle.where(identifier: @params[:vehicle_identifier]).first_or_create
    return true if vehicle.id
  end
end