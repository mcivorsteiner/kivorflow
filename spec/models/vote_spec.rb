require 'spec_helper'

describe Vote do
  context "associations" do
    it { should belong_to :user }
    it { should belong_to :votable }
  end

end