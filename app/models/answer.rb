class Answer < ActiveRecord::Base
  attr_accessible :content, :user_id, :question_id

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :content, :question_id

  def vote_total
    self.votes.empty? ? 0 : self.votes.map(&:value).inject(:+)
  end
end