require 'rails_helper'

describe SessionsController do
  
  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth
  end
  
  describe "#create" do
    
    it "should successfully create a user" do
      expect {
        post :create, provider: :strava
      }.to change{User.count}.by(1)
    end
    
    it "should successfully create a session" do
      expect(session[:user_id]).to be_nil
      post :create, provider: :strava
      expect(session[:user_id]).to_not be_nil
    end
  end
end