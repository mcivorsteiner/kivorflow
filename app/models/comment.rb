class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :question_id

  belongs_to :user
  belongs_to :commentable, polymorphic: true
end