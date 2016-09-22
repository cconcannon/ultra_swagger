class Admin::ReviewsController < ApplicationController
  before_action :require_admin
  
  def index
    @user = current_user
    set_reviews
  end
  
  def update
    r = Review.find(params[:id])
    r.update_attributes({
      reviewed: true,
      approved: params[:approved]
    })
    redirect_to admin_reviews_path
  end
  
  private
  
  def require_admin
    render file: "/public/404" unless current_admin?
  end
  
  def set_reviews
    @pending_reviews = Review.where(reviewed: false)
    @rejected_reviews = Review.where("reviewed = ? AND approved = ?", true, false)
  end
end