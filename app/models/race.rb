class Race < ApplicationRecord
  after_initialize :fetch_weather
  scope :by_name_date, -> { order(:name, date: "DESC") }
  
  private
  
  def fetch_weather
  end
end
