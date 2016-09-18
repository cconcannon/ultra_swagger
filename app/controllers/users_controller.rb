class UsersController < ApplicationController
  def show
    @user = current_user
    @strava_data = @user.update_strava_user_total
  end
end