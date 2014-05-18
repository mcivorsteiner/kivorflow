require 'spec_helper'

describe SessionsController do
  context "create(login)" do
    let!(:user) { FactoryGirl.create :user }
    it "creates a new session with correct credentials" do
      post :create, :session => { email: user.email, password: user.password }
      expect(session[:user_id]).to eq(user.id)
    end

    it "doesn't create a new session with invalid credentials" do
      session[:user_id] = nil
      post :create, :session => { email: user.email, password: "#{user.password}x"}
      expect(session[:user_id]).to eq(nil)
    end
  end

  context "destroy(logout)" do
    let!(:user) { FactoryGirl.create :user }
    it "clears session when user signed in" do
      session[:user_id] = user.id
      delete :destroy, :id => user.id
      expect(session[:user_id]).to eq(nil)
    end
  end
end