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
  },
  {
    name: "Sammamish River Trail",
    lat: "47.758693",
    lon: "-122.204173",
    distance: "3.3"
  },
  {
    name: "Big Finn Hill Park",
    lat: "47.728419",
    lon: "-122.232826",
    distance: "1.8"
  },
  {
    name: "Burke-Gilman Trail",
    lat: "47.758055",
    lon: "-122.259530",
    distance: "4.7"
  }
]

hikes.each do |hike|
  Hike.create!(hike)
end

Seed.create(nickname: 'Wall-E', hike: Hike.all[0])
Seed.create(nickname: 'Eva', hike: Hike.all[0])
Seed.create(nickname: 'April', hike: Hike.all[1])
Seed.create(nickname: 'May', hike: Hike.all[1])
Seed.create(nickname: 'August', hike: Hike.all[1])
Seed.create(nickname: 'Sunshine', hike: Hike.all[2])
Seed.create(nickname: 'Spring', hike: Hike.all[3])
Seed.create(nickname: 'Summer', hike: Hike.all[3])
Seed.create(nickname: 'Fall', hike: Hike.all[3])
Seed.create(nickname: 'Winter', hike: Hike.all[3])
