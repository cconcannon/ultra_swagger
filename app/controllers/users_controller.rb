class UsersController < ApplicationController
  def show
    @user = current_user
    @strava_data = @user.strava_user_totals.last
  end
end