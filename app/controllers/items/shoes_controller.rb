class Items::ShoesController < ApplicationController
  def index
    @brands = shoe_brands
    @items = Shoe.all
  end
  
  def show
    @item = Shoe.find(params[:id])
  end
end