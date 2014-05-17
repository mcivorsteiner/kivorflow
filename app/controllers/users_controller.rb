class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end