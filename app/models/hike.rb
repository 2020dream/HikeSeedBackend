class Hike < ApplicationRecord
  has_many :seeds, dependent: :destroy
  validates :name, :lat, :lon, :distance, presence: true

  def total_seeds
    return self.seeds.count
  end

  def self.create_with_seeds(hike_params)
    name = hike_params[:name]
    origin_lat = hike_params[:origin_lat]
    origin_lon = hike_params[:origin_lon]
    lat = hike_params[:lat]
    lon = hike_params[:lon]
    distance = hike_params[:distance]
    date = hike_params[:date]
    seeds = hike_params[:seeds]

    hike = Hike.create(name: name, origin_lat: origin_lat, origin_lon: origin_lon, lat: lat, lon: lon, distance: distance, date: date)
    if seeds != nil
      seeds.each do |seed|
        Seed.create(nickname: seed[:nickname], hike_id: hike.id)
      end
    end

    return hike
  end
end
