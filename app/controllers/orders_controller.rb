class OrdersController < ApplicationController

  def index
    @user_order = UserOrder.new
    @service = Service.find(params[:service_id])
  end

  def create
    @user_order = UserOrder.new(order_params)
    @service = Service.find(params[:service_id])
    if @user_order.valid?
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, service_id: params[:service_id])
  end
end
