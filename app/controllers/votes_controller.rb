class VotesController < ApplicationController
  def create
    @vote = current_user.votes.create(params[:vote])
    if @vote.save
      render :json => { vote_total: @vote.votable.vote_total , votable_type: @vote.votable_type.downcase, votable_id: @vote.votable_id }
    else
      render :json => { errors: @vote.errors.full_messages }
    end
  end
end