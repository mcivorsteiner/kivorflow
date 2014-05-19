require 'spec_helper'

describe QuestionsController do
  context "index" do
    it "responds to GET request to index action" do
      get :index
      expect(response).to be_success
    end

    it "assigns questions to ALL QUESTIONS" do
      get :index
      expect(assigns(:questions)).to eq Question.all
    end
  end

  context "show" do
    let!(:question) { FactoryGirl.create :question }
    it "is successful" do
      get :show, :id => question.id
      expect(response).to be_success
    end

    it "assigns correct question to varable" do
      get :show, :id => question.id
      expect(assigns(:question)).to eq question 
    end
  end
end