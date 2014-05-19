class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :commentable_id, :commentable_type

  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable

  def vote_total
    self.votes.inject {|sum, vote| sum + vote.value}
  end
end