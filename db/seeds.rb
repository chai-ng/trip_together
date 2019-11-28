User.create!([
  {uid: "105018549157264484999", first_name: "Chai Shean", last_name: "Ng", image_url: "https://lh3.googleusercontent.com/a-/AAuE7mCLoV9UyiVdikNIPInYZsgM8WKyRsMsTAYcnCSHOg", email: "chaishean@gmail.com"}
])
Trip.create!([
  {name: "test trip 2", location: "Paris", start_date: "2019-12-29 00:00:00", end_date: "2020-01-18 00:00:00", calendar_name: nil, calendar_time_zone: nil, user_id: 5, calendar_id: nil},
  {name: "test trip 2", location: "Paris", start_date: "2019-12-29 00:00:00", end_date: "2020-01-18 00:00:00", calendar_name: nil, calendar_time_zone: nil, user_id: 5, calendar_id: nil},
  {name: "test trip 2", location: "Paris", start_date: "2019-12-29 00:00:00", end_date: "2020-01-18 00:00:00", calendar_name: nil, calendar_time_zone: nil, user_id: 5, calendar_id: nil},
  {name: nil, location: "Paris", start_date: "2019-12-29 00:00:00", end_date: "2020-01-18 00:00:00", calendar_name: nil, calendar_time_zone: nil, user_id: 5, calendar_id: nil},
  {name: nil, location: "Paris", start_date: "2019-12-29 00:00:00", end_date: "2020-01-18 00:00:00", calendar_name: nil, calendar_time_zone: nil, user_id: 5, calendar_id: nil},
  {name: "redirect me", location: "Paris", start_date: "2019-12-29 00:00:00", end_date: "2020-01-18 00:00:00", calendar_name: nil, calendar_time_zone: nil, user_id: 5, calendar_id: nil},
  {name: nil, location: "Paris", start_date: "2019-12-29 00:00:00", end_date: "2020-01-18 00:00:00", calendar_name: nil, calendar_time_zone: nil, user_id: 5, calendar_id: nil},
  {name: nil, location: "Paris", start_date: "2019-12-29 00:00:00", end_date: "2020-01-18 00:00:00", calendar_name: nil, calendar_time_zone: nil, user_id: 5, calendar_id: nil},
  {name: "Test Trip", location: "Melbourne", start_date: "2019-12-01 00:00:00", end_date: "2019-12-31 00:00:00", calendar_name: nil, calendar_time_zone: nil, user_id: 5, calendar_id: nil},
  {name: "test trip", location: nil, start_date: nil, end_date: nil, calendar_name: nil, calendar_time_zone: nil, user_id: 5, calendar_id: "r8dr8gc90983q36668u6t4q9m8@group.calendar.google.com"},
  {name: "Paris Trip", location: "Paris", start_date: "2019-12-29 00:00:00", end_date: "2020-01-18 00:00:00", calendar_name: nil, calendar_time_zone: nil, user_id: 5, calendar_id: nil},
  {name: "Paris Trip", location: "Paris", start_date: "2019-12-29 00:00:00", end_date: "2020-01-18 00:00:00", calendar_name: nil, calendar_time_zone: nil, user_id: 5, calendar_id: nil}
])
Place.create!([
  {place_id: nil, trip_id: 1, name: "The Ian Potter Foundation", international_phone_number: nil, formatted_address: "Level 3/111 Collins St, Melbourne VIC 3000, Australia", latitude: "144.9702436", longitude: "-37.8145949", website: nil, opening_hours: nil, rating: 4.5, price_level: nil, cost: nil, user_id: 5, establishment_type: ["point_of_interest", "establishment"], upvote: 0, downvote: 0},
  {place_id: nil, trip_id: 1, name: "The General Assembly", international_phone_number: nil, formatted_address: "29 S Wharf Promenade, South Wharf VIC 3006, Australia", latitude: "144.9507139", longitude: "-37.824143", website: nil, opening_hours: nil, rating: 4.2, price_level: nil, cost: nil, user_id: 5, establishment_type: ["restaurant", "bar", "food", "point_of_interest", "establishment"], upvote: 0, downvote: 0},
  {place_id: nil, trip_id: 1, name: "Rockpool Bar & Grill", international_phone_number: nil, formatted_address: "Crown Entertainment Complex, 8 Whiteman St, Southbank VIC 3006, Australia", latitude: "144.96027", longitude: "-37.8218482", website: nil, opening_hours: nil, rating: 4.2, price_level: nil, cost: nil, user_id: 5, establishment_type: ["bar", "restaurant", "food", "point_of_interest", "establishment"], upvote: 1, downvote: 0},
  {place_id: nil, trip_id: 1, name: "National Gallery of Victoria", international_phone_number: nil, formatted_address: "180 St Kilda Rd, Melbourne VIC 3006, Australia", latitude: "144.9689278", longitude: "-37.8225942", website: nil, opening_hours: nil, rating: 4.7, price_level: nil, cost: nil, user_id: 5, establishment_type: ["art_gallery", "tourist_attraction", "point_of_interest", "establishment"], upvote: 1, downvote: 0},
  {place_id: nil, trip_id: 1, name: "State Library Victoria", international_phone_number: nil, formatted_address: "328 Swanston St, Melbourne VIC 3000, Australia", latitude: "144.9651897", longitude: "-37.8098087", website: nil, opening_hours: nil, rating: 4.7, price_level: nil, cost: nil, user_id: 5, establishment_type: ["art_gallery", "library", "tourist_attraction", "point_of_interest", "establishment"], upvote: 1, downvote: 0}
])
Vote.create!([
  {place_id: 5, trip_id: 1, user_id: 5, vote_type: "upvote"},
  {place_id: 11, trip_id: 1, user_id: 5, vote_type: "upvote"},
  {place_id: 7, trip_id: 1, user_id: 5, vote_type: "upvote"}
])
Traveller.create!([
  {trip_id: 11, user_email: "chaishean@gmail.com", existing_user: true, accepted_invite: true, user_budget: nil},
  {trip_id: 12, user_email: "chaishean@gmail.com", existing_user: true, accepted_invite: true, user_budget: nil},
  {trip_id: 11, user_email: "emile@gmail.com", existing_user: false, accepted_invite: true, user_budget: nil}
])
