class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to questions_path
    else
      redirect_to root_path, :notice => "Invalid email or password"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end