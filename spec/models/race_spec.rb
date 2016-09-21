require 'rails_helper'

describe Race do
  it { should validate_presence_of :name }
  it { should validate_presence_of :location }
  it { should validate_presence_of :date }
  
  xit "fetches coordinates with an API call" do
    race_params = {
      name: "Western States 100",
      location: "Squaw Valley, CA",
      date: "2016-06-23"
    }
    race = Race.new(race_params)
    race.fetch_coordinates
    
    expect(race.lat).to eq(39.1969804)
    expect(race.lon).to eq(-120.2357055)
  end
  
  xit "fetches weather with an API call" do
    race_params = {
      name: "Western States 100",
      location: "Squaw Valley, CA",
      date: "2016-06-23",
      lat: 39.1969804,
      lon: -120.2357055
    }
    race = Race.new(race_params)
    race.fetch_weather
    
    expect(race.temp_high).to eq(82.12)
    expect(race.temp_low).to eq(48.12)
    expect(race.climate).to eq("Clear throughout the day.")
  end
end
    