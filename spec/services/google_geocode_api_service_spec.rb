require 'rails_helper'

describe GoogleGeocodeApiService, vcr: true do
  it "returns latitude and longitude for a city name" do    
    VCR.use_cassette("google_geocode_api_denver") do
      client = GoogleGeocodeApiService.new("Denver, CO")
      response = client.get_coordinates
      
      expect(response[:results][0][:geometry][:location][:lat]).to eq(39.7392358)
      expect(response[:results][0][:geometry][:location][:lng]).to eq(-104.990251)
    end
  end
end