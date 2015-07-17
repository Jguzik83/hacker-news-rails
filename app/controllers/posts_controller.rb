class PostsController < ApplicationController

  def index
    @posts = Post.all
    @comments = Comment.all
  end


  def new
    @post = Post.new
    @user = User.find_by(id: session[:user_id])
  end

  def newest
    @posts = Post.all.order(created_at: :desc)
    @user = User.find_by(id: session[:user_id])
  end

  def create
    post = Post.new(post_params)
    @user = User.find_by(id: session[:user_id])
    post.user = @user
    if post.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments

  end

  def edit
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :text)
  end

end
