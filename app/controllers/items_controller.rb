class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews
    @user = current_user
  end
end