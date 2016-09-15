Rails.application.routes.draw do
  root to: "welcome#index"
  
  resources :users, only: :show
  
  get "/auth/strava/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
