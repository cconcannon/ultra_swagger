require 'rails_helper'

describe WelcomeController do
  
  describe "#index" do
    it "should show the homepage" do
      get :index
      expect(response).to be_success
    end
  end
end