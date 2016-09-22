require 'rails_helper'

describe "user is on the home page" do
  fixtures :items
  fixtures :races
  fixtures :users
  fixtures :strava_user_totals
  fixtures :reviews
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
end
# and I fill in the form with required information
# and I click "Submit review"
# I am redirected to "root/users/:id"
# and I see my review listed in "Pending Reviews"