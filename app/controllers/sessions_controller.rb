class SessionsController < ApplicationController
  def create
    begin
      user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      user.update_attribute(:token, 
        request.env["omniauth.auth"]["credentials"]["token"])
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