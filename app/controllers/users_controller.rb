class UsersController < ApplicationController
  def show
    @user = current_user
    @approved_reviews = @user.reviews.where(approved: true)
    @pending_reviews = @user.reviews.where(reviewed: false)
    @rejected_reviews = @user.reviews.where(reviewed: false, approved: false)
    @strava_data = @user.strava_user_totals.last
  end
end