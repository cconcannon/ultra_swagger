require 'rails_helper'

describe "user is on the home page" do
  fixtures :strava_user_totals
  # As a visitor
  scenario "not logged in" do
    # when I am on the home page
    visit "/"
    # and I click the button to submit a review
    click_on "Submit A Product Review"
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
    # When I visit the site
    visit "/"
    # when I click on "Submit new product review"
    click_on "Submit A Product Review"
    # I am redirected to "reviews/new"
    expect(current_path).to eq("/reviews/new")
    # and I fill in the new review form
    fill_in "item[type]", with: "Outerwear"
    fill_in "item[brand]", with: "My Brand"
    fill_in "item[model]", with: "New Jacket"
    fill_in "item[sex]", with: "M"
    fill_in "review[rating]", with: 10
    fill_in "review[comments]", with: "Pricey, but worth every penny! Has saved my butt plenty of times at altitude"
    fill_in "race[name]", with: "Western States 100"
    fill_in "race[distance]", with: "100 miles"
    fill_in "race[location]", with: "Squaw Valley, CA"
    fill_in "race[date]", with: "2014-06-25"
    # and I click "Submit Review"
    click_on "Submit Review"
    # I am redirected to "users/:id
    expect(current_path).to eq(user_path(1))
    within("#user-1-pending-reviews") do
      expect(page).to have_content("My Brand New Jacket")
      expect(page).to have_content("Western States 100")
      expect(page).to have_content("Pricey, but worth every penny!")
    end
    # and when I visit that type index page
    visit "/items/outerwear"
    # the item is visible
    expect(page).to have_content("My Brand New Jacket")
  end
end
# and I fill in the form with required information
# and I click "Submit review"
# I am redirected to "root/users/:id"
# and I see my review listed in "Pending Reviews"