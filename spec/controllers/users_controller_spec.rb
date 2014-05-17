require 'spec_helper'

describe UsersController do
  let!(:user) { FactoryGirl.create :user }
  context "show" do
    
    it "is successful" do
      get :show, :id => user.id
      expect(response).to be_success
    end

    it "user assigned in controller is correct user" do
      get :show, :id => user.id
      expect(assigns(:user)).to eq user
    end
  end

  context "create" do
    it "creates a new user with valid attributes" do
      expect {
        post :create, :user => FactoryGirl.attributes_for(:user)
      }.to change {User.count}.by(1)
      expect(response).to be_redirect
    end

    it "doesn't create user with invalid attributes" do
      expect {
        post :create
      }.to_not change {User.count}
    end
  end
end