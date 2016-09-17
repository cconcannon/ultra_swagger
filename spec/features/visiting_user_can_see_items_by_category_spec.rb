require 'rails_helper'

RSpec.describe "visiting user shopping for gear" do
  fixtures :shoes
  fixtures :hydration_packs
  fixtures :outerwears
  fixtures :base_layers
  
  scenario "they see all the categories on the home page" do
    # When I visit the root path as a visiting user
    visit "/"
    # I see a list of gear categories
    expect(page).to have_link("Shoes")
    expect(page).to have_link("Hydration")
    expect(page).to have_link("Outerwear")
    expect(page).to have_link("Base Layers")
  end

  scenario "they navigate to the Shoes category page" do
    visit "/"
    # and when I click "Shoes"
    click_link "Shoes"
    # I am taken to "root/reviews/shoes"
    expect(current_path).to eq("/reviews/shoes")
    # and I can see shoe models sorted by strava-weighted average ratings
    expect(first(".item")).to have_content("Overall: 10/10")
    expect(last(".item")).to have_content("Overall: 1/10")
    # and I can see a list of shoe manufacturers
    expect(page).to have_link("New Balance")
    expect(page).to have_link("Salomon")
  end

  xscenario "they navigate to the Hydration category page" do
    visit "/"
    # and when I click "Hydration"
    click_link "Hydration"
    # I am taken to "root/reviews/hydration"
    expect(current_path).to eq("/reviews/hydration")
    # and I can see hydration packs sorted by strava-weighted average ratings
    expect(first(".item")).to have_content("Overall: 10/10")
    expect(last(".item")).to have_content("Overall: 1/10")
    # and I can see a list of hydration pack manufacturers
    expect(page).to have_link("Ultimate Direction")
    expect(page).to have_link("Salomon")
  end

  xscenario "they navigate to the Outerwear category page" do
    visit "/"
    # and when I click "Outerwear"
    click_link "Outerwear"
    # I am taken to "root/reviews/outerwear"
    expect(current_path).to eq("/reviews/outerwear")
    # and I can see outerwear models sorted by strava-weighted average ratings
    expect(first(".item")).to have_content("Overall: 10/10")
    expect(last(".item")).to have_content("Overall: 1/10")
    # and I can see a list of outerwear manufacturers
    expect(page).to have_link("Patagonia")
    expect(page).to have_link("Marmot")
  end

  xscenario "they navigate to the Base Layers category page" do
    visit "/"
    # and when I click "Base Layers"
    click_link "Base Layers"
    # I am taken to "root/reviews/base_layers"
    expect(current_path).to eq("/reviews/base_layers")
    # and I can see base layer models sorted by strava-weighted average ratings
    expect(first(".item")).to have_content("Overall: 10/10")
    expect(last(".item")).to have_content("Overall: 1/10")
    # and I can see a list of base layer manufacturers
    expect(page).to have_link("Patagonia")
    expect(page).to have_link("Salomon")
  end
end  