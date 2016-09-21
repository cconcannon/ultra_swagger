require 'rails_helper'

describe StravaUserTotalService, :vcr => true do
  fixtures :users
  
  it "returns the user's YTD stats" do
    VCR.use_cassette('strava_user_ytd_stats') do
      client = StravaUserTotalService.new(User.find(1))
      response = client.data
      
      expect(response).to be_an_instance_of(Hash)
      expect(response).to have_key(:ytd_run_totals)
    end
  end
end