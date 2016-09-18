class Items::OuterwearController < ApplicationController
  def index
    @brands = outerwear_brands
    @items = Outerwear.all
  end
  
  def show
    @item = Outerwear.find(params[:id])
  end
end