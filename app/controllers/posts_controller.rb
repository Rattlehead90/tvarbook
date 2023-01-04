class PostsController < ApplicationController
  def index
    @post = current_user.posts.build
    @comment = current_user.comments.build
    @like = current_user.likes.build
    @posts = if params[:query].present?
               Post.where('LOWER (body) LIKE LOWER (?)', "%#{params[:query]}%")
             else
               Post.all
             end

    if turbo_frame_request?
      render partial: 'posts', locals: { posts: @posts }
    else
      render :index
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    if current_user.posts.create(post_params)

      redirect_to root_path
    else
      render root_path, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end
end
