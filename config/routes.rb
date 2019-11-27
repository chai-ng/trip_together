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

  # Trips API
  get "/api/trips", to:"api/trips#index"
  post "/api/trips/new", to:"api/trips#new"
  patch "/api/trips/:id/edit", to:"api/trips#update"
  delete "/api/trips/:id/delete", to: "api/trips#delete"

  # Travellers API
end