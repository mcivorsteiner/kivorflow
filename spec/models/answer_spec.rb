require 'spec_helper'

describe Answer do
  context "associations" do
    it { should belong_to :user }
    it { should belong_to :question }
    it { should have_many :comments }
    it { should have_many :votes }
  end
end