require 'spec_helper'

describe VotesController do
  let!(:question) { FactoryGirl.create(:question) }
  let!(:answer) { FactoryGirl.create(:answer) }
  let!(:user) { FactoryGirl.create(:user) }
  before(:each) { stub_current_user(user) }
  
  context 'create' do
    it 'should create vote with correct credentials' do
      expect {
        post :create, "vote" => { votable_type: "Question", votable_id: question.id, value: 1 }
      }.to change{Vote.count}.by(1)
    end
  end
end
