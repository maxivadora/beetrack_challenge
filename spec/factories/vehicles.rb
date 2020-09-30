# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint           not null, primary key
#  identifier :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :vehicle do
    identifier { Faker::Alphanumeric.alphanumeric(number: 5).upcase }
  end
end
