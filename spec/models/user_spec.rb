require 'spec_helper'

describe User do
  context "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should ensure_length_of(:password) }
  end

  context "associations" do
    it { should have_many :reviews}
    it { should have_many :points}
    it { should have_many :comments}
    it { should have_many :restaurants }
    it { should have_many :votes_cast }
  end
end
