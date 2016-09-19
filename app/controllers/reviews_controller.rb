class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @review.item = Item.new
    @review.race = Race.new
  end
  
  def create
  end
end