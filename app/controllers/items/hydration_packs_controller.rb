class Items::HydrationPacksController < ApplicationController
  def index
    @brands = hydration_pack_brands
    @items = HydrationPack.all
  end
end