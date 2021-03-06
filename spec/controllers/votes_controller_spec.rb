require 'spec_helper'

describe VotesController do
  let!(:question) { FactoryGirl.create(:question) }
  let!(:answer) { FactoryGirl.create(:answer) }
  let!(:user) { FactoryGirl.create(:user) }
  
  context 'create' do
    it 'should create vote and make association to a question' do
      stub_current_user(user)
      expect {
        post :create, "vote" => { votable_type: "Question", votable_id: question.id, value: 1 }
      }.to change{question.votes.count}.by(1)
    end

    it 'should create vote make association with answer' do
      stub_current_user(user)
      expect {
        post :create, "vote" => { votable_type: "Answer", votable_id: answer.id, value: 1 }
      }.to change{answer.votes.count}.by(1)
    end

    it 'should not create a vote when user has already voted' do
      stub_current_user(user)
      post :create, "vote" => { votable_type: "Answer", votable_id: answer.id, value: 1 }
      post :create, "vote" => { votable_type: "Answer", votable_id: answer.id, value: 1 }
      expect(response.status).to eq(422)
      expect(answer.vote_total).to eq(1)
    end

    it 'should not create a vote when user not logged in' do
      post :create, "vote" => { votable_type: "Question", votable_id: question.id, value: 1 }
      expect(response.status).to eq(422)
      expect(question.vote_total).to eq(0)
    end
  end
end
