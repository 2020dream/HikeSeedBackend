class Hike < ApplicationRecord
  has_many :seeds
  validates :name, :lat, :lon, :distance, presence: true
end
