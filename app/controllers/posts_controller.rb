class PostsController < ApplicationController
  def index
    if params[:query].present?
      @posts = Post.where(" LOWER (body) LIKE ?", "%#{params[:query]}%")
    else
      @posts = Post.all
    end

    if turbo_frame_request?
      render partial: "posts", locals: { posts: @posts }
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
    @post = Post.new(post_params)

    if @post.save
      redirect_to index_path
    else
      render :new, status: :unprocessable_entity
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
end
