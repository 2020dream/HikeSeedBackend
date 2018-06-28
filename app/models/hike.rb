class Hike < ApplicationRecord
  has_many :seeds, dependent: :destroy
  validates :name, :lat, :lon, :distance, presence: true

  def total_seeds
    return self.seeds.count
  end
end
