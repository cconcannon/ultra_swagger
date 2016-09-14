class SessionsController < ApplicationController
  def create
    require 'pry'; binding.pry
    redirect_to root_path
  end
  
  def destroy
    params[:session].destroy
    redirect_to root_path
  end
end