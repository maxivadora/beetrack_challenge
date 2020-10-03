require 'rails_helper'

RSpec.describe 'Position management', type: :request do
  context "with valid position" do
    let(:position_attributes) { build(:position).attributes.except('id', 'updated_at', 'created_at') }

    it 'response successfully' do
      post '/api/v1/positions', params: { position: position_attributes }
      expect(response).to have_http_status(:ok)
    end
  end

  context "with invalid position" do
    let(:invalid_position_attributes) { attributes_for :position }

    it 'response unprocessable entity' do
      post '/api/v1/positions', params: { position: invalid_position_attributes }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end