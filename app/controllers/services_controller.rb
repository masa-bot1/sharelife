class ServicesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @services = Service.includes(:user).order('created_at DESC')
    @categories = Category.all.drop(1)
    @users = User.all.order('created_at DESC')
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @service = Service.find(params[:id])
    @user = @service.user
    @services = @user.services
    @orders = Order.where(service_id: @services)
    @like = Like.new
  end

  def edit
    @service = Service.find(params[:id])
    redirect_to action: :index unless current_user.id == @service.user_id
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to service_path(@service.id), method: :get
    else
      render :edit
    end
  end

  def destroy
    @service = Service.find(params[:id])
    redirect_to root_path unless current_user.id == @service.user_id
    redirect_to root_path if @service.destroy
  end

  def search
    @services = Service.search(params[:keyword])
  end

  def select_category_index
    @services = Service.where(category_id: params[:id]).includes(:user)
    @service = Service.where(category_id: params[:id]).first
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = "guest1"
      user.password_confirmation = user.password
      user.nickname = "take"
      user.last_name = "山田"
      user.first_name = "太郎"
      user.last_name_kana = "ヤマダ"
      user.first_name_kana = "タロウ"
      user.birthday = "2000-01-01"
      user.category_id = 3
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :category_id, :transportation_id, :prefecture_id, :duration_id, :price, :image).merge(user_id: current_user.id)
  end

end
