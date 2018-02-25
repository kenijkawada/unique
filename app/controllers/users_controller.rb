class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def followed
    @user = User.find(params[:user_id])
  end

  def follower
    @user = User.find(params[:user_id])
  end
end
