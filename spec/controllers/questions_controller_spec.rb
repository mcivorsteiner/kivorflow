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

  context "create" do
    let(:user) { FactoryGirl.create :user }
    it "assigns correct user" do
      session[:user_id] = user.id
      # log_in_user(user)
      post :create, question: FactoryGirl.attributes_for(:question)
      expect(assigns(:user)).to eq(user)
    end

    it "doesnt create question when user not logged in" do
      session[:user_id] = nil
      post :create, question: FactoryGirl.attributes_for(:question)
      expect(Question.count).to eq(0)
    end

    it "creates questin when user logged in and valid attributes" do
      session[:user_id] = user.id
      expect {
        post :create, question: FactoryGirl.attributes_for(:question)
      }.to change { Question.count }.by(1)
    end

    it "doesn't create if attributes are invalid" do
      session[:user_id] = user.id
      expect {
        post :create
      }.not_to change { Question.count }
    end
  end

end