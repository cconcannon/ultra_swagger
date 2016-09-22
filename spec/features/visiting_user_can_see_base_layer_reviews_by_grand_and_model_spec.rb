require "rails_helper"

describe "visitor is looking at base layers" do
  fixtures :all
  
  scenario "they see reviews for an individual base layer" do
    # As a visiting user
    # when I visit "/reviews/base_layers"
    visit "/items/base_layers"
    # I can see base layer models
    expect(page).to have_content("Salomon Short Tight")
    expect(page).to have_content("Tracksmith Van Cortlandt Short")
    # and I can see a list of base layer manufacturers
    expect(page).to have_selector(".brand-checkboxes")
    # and when I click on "Anton Krupicka 3.0 Race Vest"
    click_on "Salomon Short Tight"
    # I am redirected to the "Anton Krupicka 3.0 Race Vest" review page
    expect(current_path).to eq("/items/5")
    # and I can see the strava-weighted average ratings of that hydration pack
    expect(page).to have_content("Salomon Short Tight")
    # and I can see all the reviews listed by date descending
    expect(page).to have_selector(".user-review", count: 1)
  end
end