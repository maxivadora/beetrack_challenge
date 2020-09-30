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
class Position < ApplicationRecord
  validates :latitude, :longitude, :sent_at, :vehicle_identifier, presence: true

  belongs_to :vehicle, primary_key: :identifier, foreign_key: :vehicle_identifier
end
