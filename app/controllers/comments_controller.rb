class CommentsController < ApplicationController
  def create
    if current_user.comments.create(comment_params)
      redirect_to root_path
    else
      render root_path, status: :unprocessable_entity
    end
  end

  def destroy
    comment = current_user.comments.find_by(id: params[:id])
    comment.destroy

    redirect_to root_path
  end

  def update 
    comment = current_user.comments.find_by(post_id: params[:post_id],
                                            user_id: params[:user_id])

    if comment.update(comment_params)
      redirect_to root_path
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
