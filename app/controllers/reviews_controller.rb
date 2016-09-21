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
    review.update({
      user: @user,
      race: check_for_race_input,
      item: check_for_item_input,
      strava_user_total: @user.most_recent_strava_data
    })
    redirect_to user_path(@user)
  end
  
  
  
  private
  
  def check_for_race_input
    if params[:review][:race_id].to_i > 0
      Race.find(params[:review][:race_id])
    else
      race = Race.new(race_params)
      coordinates = fetch_coordinates(race)
      race.lat = coordinates[0]
      race.lon = coordinates[1]
      weather = fetch_weather(race)
      race.temp_high = weather[0]
      race.temp_low = weather[1]
      race.climate = weather[2]
      race.save
      race
    end
  end
  
  def check_for_item_input
    if params[:review][:item_id].to_i > 0
      Item.find(params[:review][:item_id])
    else
      Item.find_or_create_by(item_params)
    end
  end
  
  def race_params
    params.require(:race).permit(:name, :distance, :location, :date)
  end
  
  def item_params
    params.require(:item).permit(:type, :brand, :model, :sex, :image_path)
  end
  
  def review_params
    params.require(:review).permit(:item_id, :race_id, :user_id, :rating, :comments)
  end
  
  def fetch_coordinates(race)
    geo_service = GoogleGeocodeApiService.new(race.location)
    raw_data = geo_service.get_coordinates
    [raw_data[:results][0][:geometry][:location][:lat], raw_data[:results][0][:geometry][:location][:lng]]
  end
  
  def fetch_weather(race)
    weather_service = DarkSkyApiService.new
    raw_data = weather_service.historical_weather(race.lat, race.lon, race.date)
    [raw_data[:daily][:data][0][:temperatureMax].to_f, raw_data[:daily][:data][0][:temperatureMin].to_f,
    raw_data[:daily][:data][0][:summary]]
  end
end