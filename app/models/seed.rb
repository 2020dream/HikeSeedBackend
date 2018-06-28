class Seed < ApplicationRecord
  belongs_to :hike
  validates :nickname, presence: true
end
