class CommentsController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id])
    @comments = Comment.all

  end

  def show

  end

  def new
    @comment = Comment.new
    @user = User.find_by(id: session[:user_id])

  end

  def create
    comment = Comment.new(comment_params)
    @post = Post.find(params[:comment][:post_id])
    comment.post = @post
    if comment.save
      redirect_to root_path
    else
      flash[:notice] = "Please Leave an Actual Comment"
      redirect_to new_comment_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
