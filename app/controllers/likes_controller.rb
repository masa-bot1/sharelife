class LikesController < ApplicationController
  before_action :set_variables

  def like
    like = current_user.likes.new(service_id: @service.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(service_id: @service.id)
    like.destroy
  end

  private

  def set_variables
    @service = Service.find(params[:service_id])
    @id_name = "#like-link-#{@service.id}"
  end
end
