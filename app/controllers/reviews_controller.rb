class ReviewsController < ApplicationController
  def new
    @race_options = Race.all.by_name_date.map do |r|
      [[r.date.year, r.name].join(' '), r.id]
    end
    @items = Item.all.by_brand
    @review = Review.new
    @review.item = Item.new
    @review.race = Race.new
    @user = current_user
  end
  
  def create
    @user = current_user
    review = Review.new(review_params)
    review.user = @user
    if params[:review][:race_id]
      review.race = Race.find(params[:review][:race_id])
    else
      review.race = Race.find_or_create_by(race_params)
    end
    review.item = Item.find_or_create_by(item_params)
    review.strava_user_total = @user.most_recent_strava_data
    review.save!
    redirect_to user_path(@user)
  end
  
  
  
  private
  
  def race_params
    params.require(:race).permit(:name, :distance, :location, :date)
  end
  
  def item_params
    params.require(:item).permit(:type, :brand, :model, :sex, :image_path)
  end
  
  def review_params
    params.require(:review).permit(:race_id, :rating, :comments)
  end
end