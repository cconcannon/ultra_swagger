class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews
  end
end