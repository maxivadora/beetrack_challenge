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
    latitude { "9.99" }
    longitude { "9.99" }
    sent_at { "2020-09-30 00:06:58" }
    vehicle_identifier { "MyString" }
  end
end
