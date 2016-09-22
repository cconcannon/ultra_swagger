require 'rails_helper'

describe "visiting user is interested in races tied to reviews" do
  fixtures :all
  
  scenario "they want to see all the races" do
    # As a visitor, when I visit the home page
    visit "/"
    # and I click a button "Browse Reviews by Race"
    click_on "Browse Reviews by Race"
    # the current path should be "/races"
    expect(current_path).to eq("/races")
    # and I should see all the races which have reviews
    expect(page).to have_selector(".race", count: 3)
  end
  
  scenario "they want to see reviews associated with a race" do
    # As a visitor on the races page
    visit "/races"
    # I click a button to view Angeles Crest gear reviews
    click_on "Angeles Crest 100"
    # and I should see the race details at the top of the page
    expect(page).to have_content("Maximum Temperature (F): 95")
    expect(page).to have_content("Los Angeles, CA")
    expect(page).to have_content("Distance: 100 miles")
    # and I should see gear reviews associated with that race
    expect(page).to have_selector(".review", count: 2)
    expect(page).to have_content("New Balance Vazee Summit")
  end
end