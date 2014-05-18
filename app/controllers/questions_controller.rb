class QuestionsController < ApplicationController
  def index
  end

  def show
    @question = Question.find_by_id(params[:id])
  end

  def new
  end

  def create
    @user = User.find_by_id(session[:user_id])
    @question = Question.new(params[:question])
    if @user && @question.save
      @user.questions << @question
      redirect_to @user
    else
      redirect_to @user
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end