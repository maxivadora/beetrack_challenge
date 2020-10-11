# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint           not null, primary key
#  identifier :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_vehicles_on_identifier  (identifier) UNIQUE
#
require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:identifier) }
    it { is_expected.to validate_uniqueness_of(:identifier) }
  end
end
