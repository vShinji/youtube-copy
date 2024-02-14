class LikesController < ApplicationController
  def index
  end

  def create
    @like = current_user.likes.new(like_params)
    if !@like.save
      flash[:alert] = "You already liked this"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
