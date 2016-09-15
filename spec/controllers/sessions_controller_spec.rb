require 'rails_helper'

describe SessionsController do
  
  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:strava]
  end
  
  describe "#create" do
    
    it "should successfully create a user" do
      expect {
        process :create, params: {provider: :strava}
      }.to change{User.count}.by(1)
    end
    
    it "should successfully create a session" do
      expect(session[:user_id]).to be_nil
      process :create, params: {provider: :strava}
      expect(session[:user_id]).to_not be_nil
    end
  end
  
  describe "#destroy" do
    it "should successfully logout a user" do
      process :create, params: {provider: :strava}
      process :destroy
      expect(session[:user_id]).to be_nil
    end
  end
end