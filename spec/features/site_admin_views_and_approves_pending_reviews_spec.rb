require 'rails_helper'

describe "admin is logged in" do
  fixtures :races
  fixtures :users
  fixtures :strava_user_totals
  fixtures :items
  fixtures :reviews

  scenario "they reject a review" do
    page.set_rack_session(user_id: 1)
    # as an admin I visit my admin page
    visit "/admin/reviews"
    # and I see a list of "Pending Reviews" by date descending
    expect(page).to have_selector(".pending-review", count: 1)
    # and I see a list of "Rejected Reviews" by date descending
    expect(page).to have_selector(".rejected-review", count: 1)
    # and for the first pending review I click "Deny"
    first('.pending-review').click_on "Reject"
    # and I am still in my admin portal
    expect(current_path).to eq("/admin/reviews")
    # and I visit that product show page
    visit "/items/5"
    # I don't see the review I just denied within the page
    expect(page).to_not have_content("blah blah blah")
  end
  
  scenario "they log out" do
    page.set_rack_session(user_id: nil)
    visit "/admin/reviews"
    expect(page).to have_http_status(200)
    expect(page).to_not have_content("Pending Reviews")
  end
end