require 'spec_helper'

describe CommentsController do
  let!(:user) { FactoryGirl.create :user }
  let!(:question) { FactoryGirl.create :question }
  let!(:answer) { FactoryGirl.create :answer }
  before(:each) { stub_current_user(user) }

  context "create" do
    it "should create a comment if attributes valid" do
      expect {
        post :create, comment: { commentable_type: "Answer", commentable_id: answer.id, content: "Miss America" }
      }.to change{Comment.count}.by(1)
    end

    it "should add association to correct answer" do
      expect {
        post :create, comment: { commentable_type: "Answer", commentable_id: answer.id, content: "Miss America" }
      }.to change{answer.comments.count}.by(1)
    end

    it "should add association to correct question" do
      expect {
        post :create, comment: { commentable_type: "Question", commentable_id: question.id, content: "Unbelievable" }
      }.to change{question.comments.count}.by(1)
    end
  end
end