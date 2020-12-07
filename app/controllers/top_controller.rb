class TopController < ApplicationController
  def index
    @services = Service.includes(:user).order('created_at DESC')
    @categories = Category.all.drop(1)
    @users = User.all.order('created_at DESC')
  end
end
