class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    user = User.find_by_id(session[:user_id])
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