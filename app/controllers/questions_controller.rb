class QuestionsController < ApplicationController
  def index
    @questions = Question.order("created_at DESC")
  end

  def show
    @question = Question.find_by_id(params[:id])
    @answer = Answer.new
    @comment = Comment.new
  end

  def new
  end

  def create
    @user = current_user
    @question = Question.new(params[:question])
    if @user && @question.save
      @user.questions << @question
      render :partial => 'shared/question_display', locals: { question: @question }
    else
      render :text => @question.errors.full_messages.join(", "), status: :unprocessable_entity
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
    redirect_to user_path(current_user)
  end
end