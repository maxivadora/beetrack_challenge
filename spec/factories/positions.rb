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
FactoryBot.define do
  factory :position do
    vehicle
    latitude { Faker::Number.decimal(l_digits: 2) }
    longitude { Faker::Number.decimal(l_digits: 2) }
    sent_at { Faker::Time.between(from: 3.days.ago, to: Time.now, format: :default) }
  end
end
