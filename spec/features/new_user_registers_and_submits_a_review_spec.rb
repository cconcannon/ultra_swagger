require 'rails_helper'

describe "user is on the home page" do
  # As a visitor
  scenario "not logged in" do
    # when I am on the home page
    visit "/"
    # and I click the button to submit a review
    click_button "Submit A Review"
    # I am redirected to the new review page
    expect(current_path).to eq("/reviews/new")
    # but I see a message that I need to log in
    expect(page).to have_content("Please log in with Strava to submit a review.")
    # and the link to log in is on the page
    expect(page).to have_link("Login with Strava")
  end
    
  scenario "logged in with Strava" do
    # As a logged in user
    page.set_rack_session(user_id: 1)
    # when I click on "Submit new product review"
    click_button "Submit A Product Review"
    # I am redirected to "reviews/new"
    expect(current_path).to eq("/reviews/new")
    # and I fill in the new review form
    fill_in "Brand", with: "Patagonia"
    fill_in "Model", with: "Houdini"
    fill_in "Rating", with: 10
    fill_in "Comments", with: "Pricey, but worth every penny! Has saved my butt plenty of times at altitude"
    within(".race-details") do
      fill_in "Name", with: "Western States 100"
      fill_in "Distance", with: "100 miles"
      fill_in "Location", with: "Squaw Valley, CA"
      fill_in "Date", with: "2014-06-25"
    end
    # and I click "Submit Review"
    click_button "Submit Review"
    # I am redirected to "users/:id
    expect(current_path).to eq(user_path(1))
    within("#user-1-pending-reviews") do
      expect(page).to have_content("Patagonia Houdini")
      expect(page).to have_content("Western States 100")
      expect(page).to have_content("Pricey, but worth every penny!")
    end
  end
end
# and I fill in the form with required information
# and I click "Submit review"
# I am redirected to "root/users/:id"
# and I see my review listed in "Pending Reviews"