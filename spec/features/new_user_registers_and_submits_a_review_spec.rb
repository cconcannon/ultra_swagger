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
  
  scenario "logged in with strava" do
    page.set_rack_session(user_id: 1)
    
    visit "/reviews/new"
    fill_in('review[rating]', with: '10')
    fill_in('review[comments]', with: 'new description')
    select('HydrationPack', from: "item[type]")
    fill_in('item[brand]', with: "Salomon")
    fill_in('item[model]', with: "Advanced Skin")
    select('Uni', from: 'item[sex]')
    fill_in('item[image_path]', with: 'aaaaaaa')
    
    select('Angeles Crest 100', from: 'review[race_id]')
    click_on("Submit Review")
    
    expect(current_path).to eq(user_path(1))
  end
end
# and I fill in the form with required information
# and I click "Submit review"
# I am redirected to "root/users/:id"
# and I see my review listed in "Pending Reviews"