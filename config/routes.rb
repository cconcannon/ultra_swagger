Rails.application.routes.draw do
  root to: "welcome#index"
  
  resources :users, only: [:show]
  namespace :reviews do
    resources :hydration, only: [:index, :show]
    resources :outerwear, only: [:index, :show]
    resources :shoes, only: [:index, :show]
    resources :base_layers, only: [:index, :show]
  end
  
  get "/auth/strava/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
