require 'rails_helper'

describe "admin is logged in" do
  fixtures :all

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
  
  scenario "they approve a review" do
    # As a registered and logged in site admin
    page.set_rack_session(user_id: 1)
    # when I visit the root path
    visit "/"
    # and I click a link to "Admin Functions"
    click_on "Admin Functions"
    # I am redirected to "admin/1"
    expect(current_path).to eq("/admin/reviews")
    # and I see a list of "Rejected Reviews" by date descending
    expect(page).to have_selector(".rejected-review", count: 1)
    # and for the first review I click "Approve"
    first('.pending-review').click_on "Approve"
    # and I visit that specific product page
    visit "/items/10"
    # I see the review I just approved within the page
    expect(page).to have_content("Greatest lightweight shell, ever!")
  end
end