class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :commentable_id, :commentable_type

  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable, dependent: :destroy

  def vote_total
    self.votes.empty? ? 0 : self.votes.map(&:value).inject(:+)
  end
end