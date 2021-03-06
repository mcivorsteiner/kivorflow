class Vote < ActiveRecord::Base
  attr_accessible :value, :user_id, :votable_id, :votable_type

  belongs_to :user
  belongs_to :votable, polymorphic: true
end