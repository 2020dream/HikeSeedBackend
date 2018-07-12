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
    lat: "47.775635",
    lon: "-122.185626",
    distance: "1.7",
    origin_lat: "47.794123",
    origin_lon: "-122.201123",
    date: "06-15-2018"
  },
  {
    name: "Burke Gilman Trail",
    lat: "47.719802",
    lon: "-122.280579",
    distance: "3.2",
    origin_lat: "47.758003",
    origin_lon: "-122.263859",
    date: "06-23-2018"
  },
  {
    name: "Sammamish River Trail",
    lat: "47.740874",
    lon: "-122.152917",
    distance: "1.1",
    origin_lat: "47.752402",
    origin_lon: "-122.166221",
    date: "07-01-2018"
  }
]

hikes.each do |hike|
  Hike.create!(hike)
end

Seed.create(nickname: 'Vandom', hike: Hike.all[0])
Seed.create(nickname: 'Micksik', hike: Hike.all[1])
Seed.create(nickname: 'Nientor', hike: Hike.all[1])
Seed.create(nickname: 'Ibard', hike: Hike.all[1])
Seed.create(nickname: 'Anoden', hike: Hike.all[2])
