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
    distance: 1.7,
    origin_lat: "47.794123",
    origin_lon: "-122.201123",
    date: "06-02-2018",
    is_harvest: true
  },
  {
    name: "Burke Gilman Trail",
    lat: "47.719802",
    lon: "-122.280579",
    distance: 3.2,
    origin_lat: "47.758003",
    origin_lon: "-122.263859",
    date: "06-10-2018",
    is_harvest: true
  },
  {
    name: "Sammamish River Trail",
    lat: "47.740874",
    lon: "-122.152917",
    distance: 1.1,
    origin_lat: "47.752402",
    origin_lon: "-122.166221",
    date: "06-14-2018",
    is_harvest: false
  },
  {
    name: "Beach Trail",
    lat: "47.7338116",
    lon: "-122.2647653",
    distance: 2.2,
    origin_lat: "47.7251253",
    origin_lon: "-122.2339987",
    date: "06-17-2018",
    is_harvest: true
  },
  {
    name: "North Jungle",
    lat: "47.625412",
    lon: "-122.294506",
    distance: 1.8,
    origin_lat: "47.646236",
    origin_lon: "-122.291979",
    date: "06-23-2018",
    is_harvest: false
  },
  {
    name: "Meadowdale Beach Park",
    lat: "47.859934",
    lon: "-122.335046",
    distance: 1.1,
    origin_lat: "47.857669",
    origin_lon: "-122.315176",
    date: "07-01-2018",
    is_harvest: false
  },
  {
    name: "Beautiful Forest",
    lat: "47.715825",
    lon: "-122.374692",
    distance: 1.3,
    origin_lat: "47.703423",
    origin_lon: "-122.363273",
    date: "07-04-2018",
    is_harvest: false
  },
  {
    name: "Quiet Forest",
    lat: "47.661995",
    lon: "-122.435668",
    distance: 1.8,
    origin_lat: "47.654571",
    origin_lon: "-122.40378",
    date: "07-14-2018",
    is_harvest: false
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
Seed.create(nickname: 'Wall-E', hike: Hike.all[3])
Seed.create(nickname: 'Eva', hike: Hike.all[3])
Seed.create(nickname: 'Nordin', hike: Hike.all[4])
Seed.create(nickname: 'Nathan', hike: Hike.all[5])
Seed.create(nickname: 'Natalie', hike: Hike.all[6])
Seed.create(nickname: 'Addison', hike: Hike.all[7])
