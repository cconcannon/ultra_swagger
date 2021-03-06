Rails.application.routes.draw do
  root to: "welcome#index"
  
  resources :users, only: [:show]
  resources :reviews, only: [:new, :create]
  resources :races, only: [:index, :show]
  
  namespace :admin do
    resources :reviews, only: [:index, :update]
  end
  
  namespace :items do
    resources :hydration_packs, only: [:index]
    resources :outerwear, only: [:index]
    resources :shoes, only: [:index]
    resources :base_layers, only: [:index]
  end
  resources :items, only: [:show]
  
  get "/auth/strava/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
