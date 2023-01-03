class LikesController < ApplicationController
  def create
    if current_user.likes.create(like_params)
      redirect_to root_path
    else
      render root_path, status: :unprocessable_entity
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
  end

  private
  
  def like_params
    params.require(:like).permit(:user_id, :reference_id, :reference_type)
  end
end
