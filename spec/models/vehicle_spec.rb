# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint           not null, primary key
#  identifier :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  context 'model validations' do
    it { should validate_presence_of(:identifier) }
    it { should validate_uniqueness_of(:identifier) }
  end
end
