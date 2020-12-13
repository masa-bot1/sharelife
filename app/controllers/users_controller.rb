class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @services = @user.services
    @orders = Order.where(service_id: @services)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to "show"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, :category_id) # 編集出来る情報を制限
  end
end
