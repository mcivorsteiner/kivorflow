class Answer < ActiveRecord::Base
  attr_accessible :content, :user_id, :question_id

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def vote_total
    self.votes.empty? ? 0 : self.votes.map(&:value).inject(:+)
  end
end