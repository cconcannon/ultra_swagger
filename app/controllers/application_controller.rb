class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_admin?
  helper_method :shoe_brands
  helper_method :hydration_pack_brands
  helper_method :base_layer_brands
  helper_method :outerwear_brands
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_admin?
    if current_user
      current_user.admin
    else
      false
    end
  end

  def shoe_brands
    @brands = Shoe.pluck("brand").uniq
  end
  
  def hydration_pack_brands
    @brands = HydrationPack.pluck("brand").uniq
  end
  
  def base_layer_brands
    @brands = BaseLayer.pluck("brand").uniq
  end
  
  def outerwear_brands
    @brands = Outerwear.pluck("brand").uniq
  end
end
