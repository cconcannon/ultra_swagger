class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews.where(approved: true)
    @user = current_user
  end
end