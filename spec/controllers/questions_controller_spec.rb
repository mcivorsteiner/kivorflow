require 'spec_helper'

describe QuestionsController do
  let!(:question) { FactoryGirl.create :question }
  let!(:answer) { FactoryGirl.create :answer }
  let(:user) { FactoryGirl.create :user }
  before(:each) { stub_current_user(user) }


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
    it "creates questin when user logged in and valid attributes" do
      expect {
        post :create, question: FactoryGirl.attributes_for(:question)
      }.to change { Question.count }.by(1)
    end

    it "doesn't create if attributes are invalid" do
      expect {
        post :create
      }.not_to change { Question.count }
    end
  end

  context "edit" do
    it "is successful" do
      get :edit, :id => question.id
      expect(response).to be_success
    end

    it "assigns @question to correct question" do
      get :edit, :id => question.id
      expect(assigns(:question)).to eq(question)
    end
  end

  context "update" do
    it "assigns @question to correct question" do
      post :update, :id => question.id
      expect(assigns(:question)).to eq(question)
    end

    it "correctly updates question attributes" do
      post :update, :id => question.id, question: { title: "test", content: "test" }
      expect(Question.find(question.id).content).to eq("test")
    end

    it "does not update question when invalid attributes given" do
      post :update, :id => question.id, question: { title: nil, content: "test" }
      expect(Question.find(question.id).content).to eq(question.content)
    end
  end

  context "destroy" do
    it "assigns correct question to @question" do
      delete :destroy, id: question.id
      expect(assigns(:question)).to eq(question)
    end

    it "deletes question from database" do
      expect {
        delete :destroy, id: question.id
      }.to change{Question.count}.by(-1)
    end

    it "deletes comments associated with question being deleted" do
      create_question_comment(user, question)
      expect {
        delete :destroy, id: question.id
      }.to change{Comment.count}.by(-1)
    end

    it "deletes answers associated with question being deleted" do
      expect {
        delete :destroy, id: answer.question.id
      }.to change{Answer.count}.by(-1)
    end
  end

end