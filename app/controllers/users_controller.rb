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
      flash[:sign_up_errors] = @user.errors.full_messages
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