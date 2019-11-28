Rails.application.routes.draw do
  resources :votes
  resources :places
  resources :travellers
  resources :trips
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :session, only: [:create, :destroy]

  # homepage
  root 'welcome#index'
  post "/login", to: redirect("/auth/google_oauth2")
  post "/logout", to: "sessions#destroy"
  get "/auth/google_oauth2/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  
  # Trips
  get "/trips/:id/places", to: "places#index"
    # Show me all of the places for this trip (/api/places?trip_id=)
      # Create the box
      # Plot on map
    # Show me the total votes so far for each place
    # Let me search
    # Let me add (/api/places/create?searchstring=Melbourne+Aquarium&trip_id=)
      # Take the new place object and plot it on the map
      # Take the new place object and create the box that you can up and down vote on
    # Let me up and downvote (/api/votes/create?place_id=&trip_id=&vote_type='upvote' or 'downvote')
    # Let me add this place to a trip (redirect to /trips/:id/calendar/new?place_id=)
    # Delete place of interest (DELETE /api/places/:place_id) - remove the box off the page / refresh page
  get "/trips/:id/places/new", to: "places#new"
  get "/trips/:id/calendar", to: "trips#calendar"
  get "/trips/:id/travellers", to: "trips#travellers"
  get "/trips/:id/addpeople", to: "trips#addpeople"

  # Trips API
  get "/api/trips", to:"api/trips#index"
  get "/api/trips/create", to:"api/trips#create"
  get "/api/trips/:id", to: "api/trips#show"
  get "/api/trips/:id/update", to:"api/trips#update"
  delete "/api/trips/:id", to: "api/trips#delete"
  
  # Places API
  get "/api/places", to:"api/places#index"
  get "/api/places/search", to:"api/places#search"
  get "/api/places/create", to:"api/places#create"
  get "/api/places/:id", to: "api/places#show"
  delete "/api/places/:id/delete", to: "api/places#delete"

  # Travellers API
  get "/api/travellers", to:"api/travellers#index"
  get "/api/travellers/create", to:"api/travellers#create"
  delete "/api/travellers/:id", to: "api/travellers#delete"

  # Votes API
  get "/api/votes", to:"api/votes#index"
  get "/api/votes/sum", to:"api/votes#sum_by_place"
  get "/api/votes/create", to:"api/votes#create"
  get "/api/votes/:id/update", to:"api/votes#update"
  delete "/api/votes/:id", to: "api/votes#delete"  

  # Calendar API
  get "/api/calendar/create", to:"api/calendar#create"
  get "/api/calendar/:trip_id", to: "api/calendar#show"
  get "/api/calendar/:trip_id/update", to:"api/calendar#update"
  delete "/api/calendar/:trip_id", to: "api/calendar#delete"

  # Event API
  get "/api/calendar/:trip_id/event/create", to:"api/calendar#create_event"
  get "/api/calendar/:trip_id/event/:id", to: "api/calendar#view_event"
  get "/api/calendar/:trip_id/event/:id/update", to:"api/calendar#update_event"
  delete "/api/calendar/:trip_id/event/:id", to: "api/calendar#delete_event"

end