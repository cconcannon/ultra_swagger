require_relative 'strava_data_formatter'

module ApplicationHelper
  include StravaDataFormatter
  
  def parse(input)
    JSON.parse(input, symbolize_names: true)
  end
end
