class AnswersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    question = Question.find(params[:question_id])
    @answer = question.answers.build(content: params[:answer][:content], user_id: session[:user_id])
    if @answer.save
      redirect_to question_path(question)
    else
      redirect_to question_path(question)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end