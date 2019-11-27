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
  get "/trips/:id/addpeople", to: "trips#addpeople"
  get "/trips/:id/places", to: "places#index"
  get "/trips/:id/places/new", to: "places#new"
  
  # Trips API
  get "/api/trips", to:"api/trips#index"
  get "/api/trips/create", to:"api/trips#create"
  get "/api/trips/:id", to: "api/trips#show"
  get "/api/trips/:id/update", to:"api/trips#update"
  delete "/api/trips/:id", to: "api/trips#delete"
  
  # Places API
  get "/api/places", to:"api/places#index"
  get "/api/places/search", to:"api/places#search"
  get "/api/places/new", to:"api/places#new"
  get "/api/places/:id", to: "api/places#show"
  delete "/api/places/:id" to: "api/places#delete"

  # Travellers API
  get "/api/travellers", to:"api/travellers#index"
  get "/api/travellers/create", to:"api/travellers#create"
  get "/api/travellers/:id", to: "api/travellers#show"
  get "/api/travellers/:id/update", to:"api/travellers#update"
  delete "/api/travellers/:id", to: "api/travellers#delete"

  # Votes API
  get "/api/trips/:id/votes", to:"api/votes#index"
  get "/api/trips/:id/votes/create", to:"api/votes#create"
  get "/api/trips/:id/votes/:vote_id", to: "api/votes#show"
  get "/api/trips/:id/votes/:vote_id/update", to:"api/votes#update"
  delete "/api/trips/:id/votes/:vote_id", to: "api/votes#delete"  
  
  # Calendar API
  # Be able to create a Google calendar when trip is created
  post "/api/calendar/create", to:"api/calendar#create"
  # Be able to view events on the trip Google calendar
  get "/api/calendar/:id", to: "api/calendar#show"
  # Be able to update calendar metadata
  get "/api/calendar/:id/update", to:"api/calendar#update"
  # Be able to delete the calendar when trip is deleted
  delete "/api/calendar/:id", to: "api/calendar#delete"  

  # Events API
  # Be able to view event
  get "/api/calendar/:id/events/:event_id", to: "api/calendar#showevent"
  # Be able to update event
  get "/api/calendar/:id/events/:event_id/update", to: "api/calendar#updateevent"
  # Be able to delete event
  get "/api/calendar/:id/events/:event_id/delete", to: "api/calendar#deleteevent"

end