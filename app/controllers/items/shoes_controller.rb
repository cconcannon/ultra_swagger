class Items::ShoesController < ApplicationController
  def index
    @brands = shoe_brands
    @items = Shoe.all
  end
end