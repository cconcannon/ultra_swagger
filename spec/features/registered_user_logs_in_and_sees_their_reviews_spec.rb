require 'rails_helper'

RSpec.describe "logged in user is on the home page" do
  fixtures :reviews
  fixtures :users
  
  
  scenario "they visit their account page" do
    # As a logged in user when I visit "root"
    page.set_rack_session(user_id: 1)
    visit "/"
    # and I click a link to "My Account"
    click_link "My Reviews"
    # and I see "Welcome, Christopher"
    expect(page).to have_content("Welcome, Christopher")
    # and I can see all my approved reviews listed by date descending
    # and I can see all my pending reviews listed by date descending
    # and I see a link to "Submit a new product review"
    # and I can see my Strava statistics which get tagged to new reviews
  end
end