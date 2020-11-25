class OrdersController < ApplicationController
  before_action :set_service, only: [:index, :create]
  before_action :authenticate_user!, only: :index

  def index
    @user_order = UserOrder.new
    redirect_to root_path if current_user.id == @service.user_id || @service.order.present?
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_service
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, service_id: params[:service_id], token: params[:token])
  end

  def pay_service
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @service.price,  # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_service
    @service = Service.find(params[:service_id])
  end
end
