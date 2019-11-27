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

  # Places API
  get "/api/places", to:"api/places#index"
  get "/api/places/search", to:"api/places#search"
  get "/api/places/new", to:"api/places#new"
  get "/api/places/:id", to:"api/places#show"

  # Trips API
  get "/api/trips", to:"api/trips#index"
  get "/api/trips/create", to:"api/trips#create"
  get "/api/trips/:id", to: "api/trips#show"
  get "/api/trips/:id/update", to:"api/trips#update"
  delete "/api/trips/:id", to: "api/trips#delete"

  # Travellers API

  # Votes API
  get "/api/votes", to:"api/votes#index"
  post "/api/votes/create", to:"api/votes#create"
  get "/api/votes/:id", to: "api/votes#show"
  get "/api/votes/:id/update", to:"api/votes#update"
  delete "/api/votes/:id", to: "api/votes#delete"  

end