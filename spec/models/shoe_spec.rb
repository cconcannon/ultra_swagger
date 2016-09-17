require 'rails_helper'

describe Shoe do
  it "should calculate overall_rating" do
    shoe = Shoe.new(performance: 10, annoyances: 4)
    expect(shoe.overall_rating).to eq(8)
  end
end