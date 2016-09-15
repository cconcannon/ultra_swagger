class SessionsController < ApplicationController
  def create
    begin
      user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      user.update_attribute(:token, 
        request.env["omniauth.auth"]["credentials"]["token"])
      flash[:success] = "Welcome, #{user.name}"
    rescue
      flash[:warning] = "There was an error in the Strava Authentication process"
    end
    redirect_to root_path
  end
  
  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = "You have successfully logged out!"
    end
    redirect_to root_path
  end
end