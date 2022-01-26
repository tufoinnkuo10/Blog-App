class UsersController < ApplicationController
  def index
    @users = User.first(5)
  end

  def show
    @user = User.includes(:posts).find(params[:id])
    @posts = @user.three_recent_user_post
  end
end
