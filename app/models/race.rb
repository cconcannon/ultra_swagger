class Race < ApplicationRecord
  # after_initialize :fetch_coordinates
  # after_initialize :fetch_weather
  scope :by_name_date, -> { order(:name, date: "DESC") }
  
  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true
  
  private
  
  def fetch_coordinates
    geo_service = GoogleGeocodeApiService.new(self.location)
    raw_data = service_call.get_coordinates
    self.lat = raw_data[:results][0][:geometry][:location][:lat]
    self.lon = raw_data[:results][0][:geometry][:location][:lng]
  end
  
  def fetch_weather
    weather_service = DarkSkyApiService.new(self)
    raw_data = weather_service.historical_weather
    self.temp_high = raw_data[:daily][:data][0][:temperatureMax]
    self.temp_low = raw_data[:daily][:data][0][:temperatureMin]
    self.climate = raw_data[:daily][:data][0][:summary]
  end
end
