class ReviewsController < ApplicationController
  def new
    @race_options = Race.all.by_name_date.map do |r|
      [[r.date.year, r.name].join(' '), r.id]
    end
    @item_options = Item.all.by_brand_model.map do |i|
      [[i.sex, i.brand, i.model].join(' '), i.id]
    end
    @review = Review.new
    @review.item = Item.new
    @review.race = Race.new
    @user = current_user
  end
  
  def create
    @user = current_user
    review = Review.new(review_params)
    review.user = @user
    review.race = check_for_race_input
    review.item = Item.find_or_create_by(item_params)
    review.strava_user_total = @user.most_recent_strava_data
    review.save!
    redirect_to user_path(@user)
  end
  
  
  
  private
  
  def check_for_race_input
    if params[:review][:race_id]
      Race.find(params[:review][:race_id])
    else
      Race.find_or_create_by(race_params)
    end
  end
  
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