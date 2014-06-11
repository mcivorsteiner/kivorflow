class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    user = current_user
    @comment = user.comments.build(params[:comment])
    if @comment.save
      parent = @comment.commentable
      render partial: 'shared/comment_display', locals: { comment: @comment }
    else
      redirect_to @comment.commentable
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end