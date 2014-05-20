require 'spec_helper'

describe AnswersController do
  let!(:user) { FactoryGirl.create :user }
  let!(:question) { FactoryGirl.create :question }
  before(:each) { stub_current_user(user) }

  context "create" do
    it "should create answer if attributes valid" do
      expect {
        post :create, answer: build_attributes(:answer), question_id: question.id
      }.to change{Answer.count}.by(1)
    end

    it "should not create answer if attributes not valid(no question_id in params[:answer])" do
      expect {
        post :create, answer: {content: "hello"}, question_id: question.id
      }.not_to change{Answer.count}
    end
  end 
end