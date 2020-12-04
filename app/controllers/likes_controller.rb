class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(service_id: params[:service_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(service_id: params[:service_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
