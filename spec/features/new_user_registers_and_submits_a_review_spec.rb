require 'rails_helper'

describe "user is on the home page" do
  scenario "logged in with Strava" do
    # As a logged in user
    page.set_rack_session(user_id: 1)
  end
end
# when I visit the root path
# and I click on "Register"
# and I login in with Strava OAuth
# I am redirected to "root/users/:id"
# and I see my Strava statistics
# and when I click on "Submit a new product review -> shoes"
# I am redirected to "root/reviews/shoes/new"
# and I fill in the form with required information
# and I click "Submit review"
# I am redirected to "root/users/:id"
# and I see my review listed in "Pending Reviews"