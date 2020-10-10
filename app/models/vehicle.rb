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
class Vehicle < ApplicationRecord
  validates :identifier, presence: true, uniqueness: true
  
  has_many :positions, foreign_key: 'vehicle_identifier', primary_key: 'identifier'
end
