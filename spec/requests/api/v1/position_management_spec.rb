require 'rails_helper'

RSpec.describe 'Position management', type: :request do
  let(:vehicle) { create :vehicle }
  let(:position_attributes) { attributes_for :position }

  it 'creates a position' do
    post '/api/v1/positions', params: { position: position_attributes.merge(vehicle_idenfifier: vehicle.identifier) }
    expect(response).to have_http_status(:ok)
  end
end