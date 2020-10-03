class CreatePositionJob < ApplicationJob
  queue_as :default

  def perform(positions_params)
    CreatePositionService.new(positions_params).perform
  end
end
 