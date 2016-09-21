class DarkSkyApiService
  
  include ApplicationHelper
  
  def initialize
    @conn = Faraday.new("https://api.darksky.net/forecast/#{ENV['dark_sky_forecast_key']}/")
  end
  
  def historical_weather(lat, lon, date)
    response = @conn.get "#{lat},#{lon},#{date.to_time.to_i}"
    data_return = parse(response.body)
  end
end