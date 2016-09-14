class SessionsController < ApplicationController
  def create
    User.find_or_create_by({
      strava_id: request.env['omniauth.auth'][:strava]["strava_id"],
      name: request.env['omniauth.auth'][:strava]["name"],
      email: request.env['omniauth.auth'][:strava]["email"]
    })
    redirect_to root_path
  end
  
  def destroy
    params[:session].destroy
    redirect_to root_path
  end
end