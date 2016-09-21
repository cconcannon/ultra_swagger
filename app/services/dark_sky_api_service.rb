class DarkSkyApiService
  
  include ApplicationHelper
  
  def initialize(race)
    @race = race
    @conn = Faraday.new("https://api.darksky.net/forecast/#{ENV['dark_sky_forecast_key']}/")
  end
  
  def historical_weather
    response = @conn.get "#{@race.lat},#{@race.lon},#{@race.date.to_time.to_i}"
    data_return = parse(response.body)
  end
end