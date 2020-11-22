class ServicesController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
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

  private

  def service_params
    params.require(:service).permit(:name, :description, :category_id, :transportation_id, :prefecture_id, :duration_id, :price, :image).merge(user_id: current_user.id)
  end
  
end
