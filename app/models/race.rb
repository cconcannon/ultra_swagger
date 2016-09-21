class Race < ApplicationRecord
  after_initialize :fetch_weather
  
  private
  
  def fetch_weather
  end
end
