require 'rails_helper'

RSpec.describe "visiting user shopping for gear" do
  fixtures :items
  
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
    # I am taken to "root/items/shoes"
    expect(current_path).to eq("/items/shoes")
    # and I can see shoe models
    expect(page).to have_selector(".index-item", count: 5)
    # and I can see a list of shoe brands
    within(".filter-options-container") do
      expect(page).to have_selector(".brand-checkboxes")
    end
  end

  scenario "they navigate to the Hydration category page" do
    visit "/"
    # and when I click "Hydration"
    click_link "Hydration"
    # I am taken to "root/reviews/hydration"
    expect(current_path).to eq("/items/hydration_packs")
    # and I can see hydration packs sorted by strava-weighted average ratings
    expect(page).to have_selector(".index-item", count: 4)
    # and I can see a list of hydration pack manufacturers
    expect(page).to have_link("Ultimate Direction")
    expect(page).to have_link("Ultraspire")
    expect(page).to have_link("Mountain Hardwear")
  end

  scenario "they navigate to the Outerwear category page" do
    visit "/"
    # and when I click "Outerwear"
    click_link "Outerwear"
    # I am taken to "root/reviews/outerwear"
    expect(current_path).to eq("/items/outerwear")
    # and I can see outerwear models
    expect(page).to have_selector(".index-item", count: 3)
    # and I can see a list of outerwear manufacturers
    expect(page).to have_link("Patagonia")
    expect(page).to have_link("Marmot")
  end

  scenario "they navigate to the Base Layers category page" do
    visit "/"
    # and when I click "Base Layers"
    click_link "Base Layers"
    # I am taken to "root/reviews/base_layers"
    expect(current_path).to eq("/items/base_layers")
    # and I can see base layer models sorted by strava-weighted average ratings
    expect(page).to have_selector(".index-item", count: 4)
    # and I can see a list of base layer manufacturers
    expect(page).to have_link("Tracksmith")
    expect(page).to have_link("Asics")
    expect(page).to have_link("Salomon")
  end
end  