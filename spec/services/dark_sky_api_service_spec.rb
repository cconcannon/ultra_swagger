require 'rails_helper'

describe DarkSkyApiService, vcr: true do
  scenario "it returns historical weather data" do
    VCR.use_cassette("dark_sky_historical_data") do
      race = Race.new(
        location: "Leadville, CO",
        date: Time.new(2016, 9, 20),
        lat: 39.2508,
        lon: -106.2925
      )
      
      client = DarkSkyApiService.new
      response = client.historical_weather(race.lat, race.lon, race.date)
      expect(response).to be_an_instance_of(Hash)
      expect(response[:daily][:data][0][:temperatureMax]).to eq(61.7)
      expect(response[:daily][:data][0][:summary]).to eq("Light rain overnight.")
    end
  end
end