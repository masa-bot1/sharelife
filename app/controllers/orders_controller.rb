class OrdersController < ApplicationController

  def index
    @user_order = UserOrder.new
    @service = Service.find(params[:service_id])
  end
end
