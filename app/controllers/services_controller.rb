class ServicesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :search_service, only: [:index, :search]

  def index
    @services = Service.includes(:user).order('created_at DESC').limit(5)
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
    @results = @p.result.includes(:user)  # 検索条件にマッチした商品の情報を取得
  end

  def select_category_index
    @services = Service.where(category_id: params[:id])
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :category_id, :transportation_id, :prefecture_id, :duration_id, :price, :image).merge(user_id: current_user.id)
  end

  def search_service
    @p = Service.ransack(params[:q])
  end
end
