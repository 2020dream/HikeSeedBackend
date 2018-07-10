class Hike < ApplicationRecord
  has_many :seeds, dependent: :destroy
  validates :name, :lat, :lon, :distance, presence: true

  def total_seeds
    return self.seeds.count
  end

  def self.create_with_seeds(hike_params)
    name = hike_params[:name]
    lat = hike_params[:lat]
    lon = hike_params[:lon]
    distance = hike_params[:distance]
    seeds = hike_params[:seeds]

    hike = Hike.create(name: name, lat: lat, lon: lon, distance: distance)
    if seeds != nil
      seeds.each do |seed|
        Seed.create(nickname: seed[:nickname], hike_id: hike.id)
      end
    end

    return hike
  end
end
