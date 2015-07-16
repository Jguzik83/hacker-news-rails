class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
  end

  def delete
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def sessions_params
    params.require(:user).permit(:username, :password)
  end
end
