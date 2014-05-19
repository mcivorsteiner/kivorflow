class Question < ActiveRecord::Base
  attr_accessible :title, :content
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def vote_total
    self.votes.empty? ? 0 : self.votes.map(&:value).inject(:+)
  end
end