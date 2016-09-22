class GoogleGeocodeApiService
  
  include ApplicationHelper
  
  def initialize(location)
    @conn = Faraday.new("https://maps.googleapis.com/maps/api/geocode/")
    @conn.params = { 
      'address' => location,
      'key' => ENV['google_maps_geocode_key'] 
    }
  end
  
  def get_coordinates
    response = @conn.get("json")
    data = parse(response.body)
  end
end