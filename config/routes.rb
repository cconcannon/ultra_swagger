Rails.application.routes.draw do
  root to: "welcome#index"
  
  get "/auth/strava/callback", to: "sessions#create"
end
