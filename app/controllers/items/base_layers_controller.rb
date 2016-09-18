class Items::BaseLayersController < ApplicationController
  def index
    @brands = base_layer_brands
    @items = BaseLayer.all
  end
  
  def show
    @item = BaseLayer.find(params[:id])
  end
end