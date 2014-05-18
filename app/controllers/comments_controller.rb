class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    question = Question.find(params[:question_id])
    @comment = question.comments.build(content: params[:comment][:content], user_id: session[:user_id])
    if @comment.save
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