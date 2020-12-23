class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @services = @user.services
    @orders = Order.where(service_id: @services)
  end

  def edit
    @user = User.find(params[:id])
    redirect_to root_path unless current_user.id == @user.id
  end
  
end
