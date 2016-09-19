require 'rails_helper'

RSpec.describe "logged in user is on the home page" do
  fixtures :users
  fixtures :races
  fixtures :reviews  
  
  scenario "they visit their reviews page" do
    page.set_rack_session(user_id: 1)
    visit "/"
    # and I click a link to "My Account"
    click_link "My Reviews"
    # and I see "Welcome, Christopher"
    expect(page).to have_content("Welcome, Christopher")
    # and I can see all my approved reviews listed by date descending
    within("#user-1-approved-reviews") do
      expect(page).to have_selector(".user-review", count: 3)
    end
    # and I can see all my pending reviews listed by date descending
    within("#user-1-pending-reviews") do
      expect(page).to have_selector(".user-review", count: 1)
    end
    
    within("#user-1-rejected-reviews") do
      expect(page).to have_selector(".user-review", count: 1)
    end
    # and I see a link to "Create a product review"
    expect(page).to have_link("Create A Product Review")
  end
end