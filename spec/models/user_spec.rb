require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_uniqueness_of(:strava_id) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:firstname) }
  it { should validate_presence_of(:lastname) }
  
  it "returns most recent strava data" do
    user_params = {
      strava_id: 9999999,
      email: "abcdefg",
      firstname: "Meeeee",
      lastname: "StravaPro"
    }
    u = User.create(user_params)
  
    data_params = {
      avg_weekly_distance: 80,
      avg_weekly_time: 10.0,
      avg_weekly_elevation_gain: 3000,
      avg_speed: 8,
      user: u
    }
    strava_totals = StravaUserTotal.create(data_params)
    
    result = u.most_recent_strava_data
    expect(result.avg_weekly_time).to eq(10.0)
  end
end
