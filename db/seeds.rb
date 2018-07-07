# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hikes = [
  {
    name: "North Creek Trail",
    lat: "47.796825",
    lon: "-122.200852",
    distance: "2.5"
  }
]

hikes.each do |hike|
  Hike.create!(hike)
end

Seed.create(nickname: 'Wall-E', hike: Hike.all[0])
Seed.create(nickname: 'Eva', hike: Hike.all[0])
