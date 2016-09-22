require 'rails_helper'

describe Item do
  it { should have_many(:reviews) }
  it "returns types" do
    types = Item.types
    expect(types).to eq(%w(Shoe, Outerwear, Base Layer, Hydration Pack))
  end
end