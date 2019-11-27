# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Place.create!([
  { "name": "Buckingham Palace", "latitude": "51.501564","longitude": "-0.141944"},
  { "name": "Westminster Abbey", "latitude": "51.499581", "longitude": "-0.127309"},
  { "name": "Big Ben", "latitude": "51.500792", "longitude": "-0.124613"}
  ])

  Place.create!([
    {
      "place_id":
      "trip_id":
      "name":
      "international_phone_number":
      "formatted_address":
      "latitude":
      "longitude":
      "website":
      "opening_hours":
      "type":
      "rating":
      "price_level":
      "cost":
      "user_id":
        }
  ])

  Trip.create!([
    {
      "name":
      "location":
      "start_date":
      "end_date":
      "created_by":
      "calendar_name":
      "calendar_timezone":
      "calendar_id":
    }
  ])