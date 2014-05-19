class AnswersController < ApplicationController
  def index
  end

  def show
    @answer = Answer.find_by_id(params[:id])
    @comment = Comment.new
  end

  def new
  end

  def create
    @answer = current_user.answers.build(params[:answer])
    if @answer.save
      render :partial => 'shared/answer_display', :locals => { answer: @answer }
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