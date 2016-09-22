class Items::OuterwearController < ApplicationController
  def index
    @brands = outerwear_brands
    @items = Outerwear.all
  end
end