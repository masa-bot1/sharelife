class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @services = @user.services
    @orders = Order.where(service_id: @services)
  end
  
end
