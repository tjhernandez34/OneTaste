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

  context "creating a new user" do
    it "should fail if password is not long enough" do
      user = User.create(:username => "hans", email: "han@solo.com", password: "hi")
      expect(user.valid?).to be(false)
    end

    it "should fail if username is not present" do
      user = User.create(email: "han@solo.com", password: "password")
      expect(user.valid?).to be(false)
    end

    it "should fail if email is not present" do
      user = User.create(username: "hans", password: "password")
      expect(user.valid?).to be(false)
    end
  end
end
