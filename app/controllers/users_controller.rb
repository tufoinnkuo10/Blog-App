class UsersController < ApplicationController
  def index
    @users = User.first(5)
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end
end
