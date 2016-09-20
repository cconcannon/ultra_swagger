class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @review.item = Item.new
    @review.race = Race.new
  end
  
  def create
    race = Race.find_or_create_by(race_params)
    item = Item.find_or_create_by(item_params)
    review = Review.new(review_params)
    review.race = race
    review.item = item
    review.user = current_user
    review.strava_user_total = current_user.most_recent_strava_data
    review.save!
    redirect_to user_path(current_user)
  end
  
  
  
  private
  
  def race_params
    params.require(:race).permit(:name, :distance, :location, :date)
  end
  
  def item_params
    params.require(:item).permit(:type, :brand, :model, :sex)
  end
  
  def review_params
    params.require(:review).permit(:rating, :comments)
  end
end