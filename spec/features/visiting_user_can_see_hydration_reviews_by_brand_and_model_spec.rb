require "rails_helper"

describe "visitor is looking at hydration packs" do
  fixtures :users
  fixtures :strava_user_totals
  fixtures :races
  fixtures :items
  fixtures :reviews
  
  scenario "they see reviews for an individual pack" do
    # As a visiting user
    # when I visit "/reviews/hydration_packs"
    visit "/items/hydration_packs"
    # I can see hydration pack models
    expect(page).to have_content("Ultimate Direction Anton Krupicka")
    expect(page).to have_content("Ultimate Direction Timothy Olson")
    # and I can see a list of hydration pack manufacturers
    expect(page).to have_selector(".brand-checkboxes")
    # and when I click on "Ultimate Direction"
    # I see only the models of "Ultimate Direction" brand packs
        # how do I test jQuery?
    # and when I click on "Anton Krupicka 3.0 Race Vest"
    click_on "Ultimate Direction Anton Krupicka Mountain Vest 3.0"
    # I am redirected to the "Anton Krupicka 3.0 Race Vest" review page
    expect(current_path).to eq("/items/1")
    # and I can see the strava-weighted average ratings of that hydration pack
    expect(page).to have_content("Average Rating: ")
    # and I can see all the reviews listed by date descending
    expect(page).to have_selector(".user-review", count: 2)
  end
end