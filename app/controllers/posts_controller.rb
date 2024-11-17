class PostsController < ApplicationController
  before_action :authenticate_user!  # Add this line to ensure user is logged in
  def index
    @posts = current_user.posts.order(created_at: :desc)
    @q = Post.ransack(params[:q])
    @posts = @q.result
    @posts = @q.result.order(created_at: :desc)
    @posts = @q.result.includes(:user).order(created_at: :desc)
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post created successfully!'
    else
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :image)
  end
end