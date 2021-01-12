class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  before_action :set_categories, only: [:show, :select_category]

  def show
    @services = @user.services
    @orders = Order.where(service_id: @services)
  end

  def edit
    redirect_to root_path unless current_user.id == @user.id
  end

  def select_category
    @users = User.where(category_id: params[:id])
    @user = User.where(category_id: params[:id]).first
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_categories
    @categories = Category.all.drop(1)
  end
end
