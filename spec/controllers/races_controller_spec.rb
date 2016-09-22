require 'rails_helper'

describe RacesController do
  fixtures :all
  
  describe "#index" do
    it "should display all the races" do
      get :index
      expect(response).to be_success
    end
  end
  
  describe "show" do    
    it "should show that race's associated reviews" do
      get :show, id: 1
      expect(response).to be_success
    end
  end
end