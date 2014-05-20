class AnswersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @answer = current_user.answers.build(params[:answer])
    if @answer.save
      render :partial => 'shared/answer_display', :locals => { answer: @answer }
    else
      render :text => @answer.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end