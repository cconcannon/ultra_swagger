class Items::ShoesController < ApplicationController
  def index
    @items = Shoe.all
  end
  
  def show
    @item = Shoe.find(params[:id])
  end
end