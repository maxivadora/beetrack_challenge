# == Schema Information
#
# Table name: positions
#
#  id                 :bigint           not null, primary key
#  latitude           :decimal(10, 6)
#  longitude          :decimal(10, 6)
#  sent_at            :datetime
#  vehicle_identifier :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_positions_on_vehicle_identifier  (vehicle_identifier)
#
class Position < ApplicationRecord
  LIMIT_MOST_RECENT = 20
  
  validates :latitude, :longitude, :sent_at, :vehicle_identifier, presence: true

  belongs_to :vehicle, primary_key: :identifier, foreign_key: :vehicle_identifier, optional: true

  scope :most_recent, -> { order(sent_at: :desc).limit(LIMIT_MOST_RECENT) }
end
