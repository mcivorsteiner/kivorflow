require 'spec_helper'

describe User do
  context "associations" do
    it { should have_many(:questions)}
    it { should have_many(:answers)}
    it { should have_many(:comments)}
    it { should have_many(:votes)}
  end

  context "validations" do
    before { FactoryGirl.create :user }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :full_name }
    it { should validate_presence_of :password_digest }
  end
end