# == Schema Information
#
# Table name: positions
#
#  id                 :bigint           not null, primary key
#  latitude           :decimal(10, 6)
#  longitude          :decimal(10, 6)
#  sent_at            :datetime
#  vehicle_identifier :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_positions_on_vehicle_identifier  (vehicle_identifier)
#
require 'rails_helper'

RSpec.describe Position, type: :model do
  it { is_expected.to validate_presence_of(:latitude) }
  it { is_expected.to validate_presence_of(:longitude) }
  it { is_expected.to validate_presence_of(:sent_at) }
  it { is_expected.to validate_presence_of(:vehicle_identifier) }
end
