class QuestionsController < ApplicationController
  def index
    @questions = Question.all
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
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to user_path(User.find(session[:user_id]))
  end
end