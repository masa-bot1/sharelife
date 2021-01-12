class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def show
    @services = @user.services
    @orders = Order.where(service_id: @services)
    @categories = Category.all.drop(1)
  end

  def edit
    redirect_to root_path unless current_user.id == @user.id
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
