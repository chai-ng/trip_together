Rails.application.routes.draw do
  resources :votes
  resources :places
  resources :travellers
  resources :trips
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :session, only: [:create, :destroy]

  # homepage
  root 'welcome#index'
<<<<<<< HEAD
  
  # sessions
  get "/login", to: redirect("/auth/google_oauth2")
=======
  post "/login", to: redirect("/auth/google_oauth2")
  post "/logout", to: "sessions#destroy"

>>>>>>> implemented csrf protection
  get "/auth/google_oauth2/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

end