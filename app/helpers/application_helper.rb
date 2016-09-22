require_relative 'strava_data_formatter'

module ApplicationHelper
  include StravaDataFormatter
  
  def parse(input)
    JSON.parse(input, symbolize_names: true)
  end
  
  def cache_key_for(thing, label = "")
    prefix = thing.to_s.downcase.pluralize
    count = thing.count
    max_updated = thing.maximum(:updated_at)
    [prefix, label, count, max_updated].join("_")
  end
end
