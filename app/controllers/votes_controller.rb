class VotesController < ApplicationController
  def create
    if logged_in? && current_user.votes.where(votable_type: params["vote"]["votable_type"], votable_id: params["vote"]["votable_id"]).empty?
      @vote = current_user.votes.create(params[:vote])
      render :json => { vote_total: @vote.votable.vote_total , votable_type: @vote.votable_type.downcase, votable_id: @vote.votable_id }
    else
      error = logged_in? ? "you can only vote once" : "must be logged in to vote"
      render :json => { error: error}, :status => :unprocessable_entity
    end
  end
end