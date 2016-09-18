class SessionsController < ApplicationController
  def create
    begin
      strava_user_data = request.env["omniauth.auth"]
      user = User.from_omniauth(strava_user_data)
      session[:user_id] = user.id
      user.update_strava_user_total
    rescue
      # session[:user_id] = nil
    end
    redirect_to user_path(user)
  end
  
  def destroy
    session.delete(:user_id) if current_user
    redirect_to root_path
  end
end