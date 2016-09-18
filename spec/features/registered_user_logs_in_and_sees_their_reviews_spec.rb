require 'rails_helper'

RSpec.describe "logged in user is on the home page" do
  fixtures :reviews
  fixtures :users
  
  
  scenario "they visit their reviews page" do
    # As a logged in user when I visit "root"
    page.set_rack_session(user_id: 1)
    visit "/"
    # and I click a link to "My Account"
    click_link "My Reviews"
    # and I see "Welcome, Christopher"
    expect(page).to have_content("Welcome, Christopher")
    # and I can see all my approved reviews listed by date descending
    within("#user-1-approved-reviews") do
      expect(page).to have_selector(".user-review", count: 2)
      expect(first(".user-review")).to have_content("January 1, 2016")
      expect(last(".user-review")).to have_content("January 1, 2015")
    end
    # and I can see all my pending reviews listed by date descending
    within("#user-1-pending-reviews") do
      expect(page).to have_selector(".user-review", count: 2)
      expect(first(".user-review")).to have_content("January 1, 2016")
      expect(last(".user-review")).to have_content("January 1, 2015")
    end
    # and I see a link to "Create a product review"
    expect(page).to have_link("Create A Product Review")
  end
end