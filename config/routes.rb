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
  get "trips/:id/places/new", to: "places#new"
  
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

  # Travellers API
  get "/api/travellers", to:"api/travellers#index"
  get "/api/travellers/create", to:"api/travellers#create"
  get "/api/travellers/:id", to: "api/travellers#show"
  get "/api/travellers/:id/update", to:"api/travellers#update"
  delete "/api/travellers/:id", to: "api/travellers#delete"

  # Votes API
  get "/api/votes", to:"api/votes#index"
  get "/api/votes/create", to:"api/votes#create"
  get "/api/votes/:id", to: "api/votes#show"
  get "/api/votes/:id/update", to:"api/votes#update"
  delete "/api/votes/:id", to: "api/votes#delete"  

  # Calendar API
  get "/api/calendar", to:"api/calendar#index"
  get "/api/calendar/create", to:"api/calendar#create"
  get "/api/calendar/:id", to: "api/calendar#show"
  get "/api/calendar/:id/update", to:"api/calendar#update"
  delete "/api/calendar/:id", to: "api/calendar#delete"  

end