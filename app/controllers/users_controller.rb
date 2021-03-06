class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :followed, :follower]

  def index
    @users = User.all
    @search = User.ransack(params[:q])
    @result = @search.result
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
