class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      render 'home/index'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end