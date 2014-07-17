require 'spec_helper'

describe Comment do
  context "validations" do
    it { should validate_presence_of :content }
  end

  context "associations" do
    it { should have_many :votes }
    it { should have_many :replies }
    it { should belong_to :review }
    it { should belong_to :parent }
    it { should belong_to :commenter }
  end

end
