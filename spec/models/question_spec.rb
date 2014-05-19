require 'spec_helper'

describe Question do
  context "associations" do
    it { should belong_to :user }
    it { should have_many :answers }
    it { should have_many :comments }
    it { should have_many :votes }
  end

  context "methods" do
    it "vote_total" do
      question = FactoryGirl.create :question
      upvote_num = rand(20)
      downvote_num = rand(20)
      upvote_num.times do
        user = FactoryGirl.create :user
        question.votes.create( value: 1, user_id: user.id )
      end
      downvote_num.times do
        user = FactoryGirl.create :user
        question.votes.create( value: -1, user_id: user.id )
      end
      expect(question.vote_total).to eq(upvote_num - downvote_num)
    end
  end
end