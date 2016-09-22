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
  
  scenario "race already exists" do
    page.set_rack_session(user_id: 1)
    
    # and I fill in the form with required information
    visit "/reviews/new"
    fill_in('review[rating]', with: '10')
    fill_in('review[comments]', with: 'new description')
    select('HydrationPack', from: "item[type]")
    fill_in('item[brand]', with: "Salomon")
    fill_in('item[model]', with: "Advanced Skin")
    select('Uni', from: 'item[sex]')
    fill_in('item[image_path]', with: 'aaaaaaa')
    
    select('Angeles Crest 100', from: 'review[race_id]')
    # and I click "Submit review"
    click_on("Submit Review")
    
    # I am redirected to "root/users/:id"
    expect(current_path).to eq(user_path(1))
    # and I see my review listed in "Pending Reviews"end
    within('#user-1-pending-reviews') do
      expect(page).to have_content("Salomon Advanced Skin")
    end
  end
  
  scenario "item already exists" do
    page.set_rack_session(user_id: 1)
    
    visit "/reviews/new"
    select('New Balance Vazee Summit', from: 'review[item_id]')
    fill_in('race[name]', with: "Western States 100")
    fill_in('race[location]', with: "Squaw Valley, CA")
    fill_in('race[distance]', with: "100 miles")
    fill_in('race[date]', with: "2014-06-26")
    click_on "Submit Review"
    
    expect(current_path).to eq(user_path(1))
    within '#user-1-pending-reviews' do
      expect(page).to have_content("New Balance Vazee Summit")
    end
  end
end