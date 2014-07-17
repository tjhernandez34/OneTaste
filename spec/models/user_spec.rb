require 'spec_helper'

describe User do
  context "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should ensure_length_of(:password) }
  end

  context "associations" do
    it { should have_many(:reviews).with_foreign_key("reviewer_id") }
    it { should have_many(:points).through(:reviews).source(:votes) }
    it { should have_many(:comments).with_foreign_key("commenter_id") }
    it { should have_many(:restaurants).with_foreign_key("creator_id") }
    it { should have_many(:votes_cast).class_name("Vote").with_foreign_key("voter_id") }
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

  let(:user) { User.create(:username => "hans", email: "han@solo.com", password: "hi") }

  it "should have a username" do
    expect(user.username).to eq("hans")
  end

  it "should have an email" do
    expect(user.email).to eq("han@solo.com")
  end

  it "should have a password" do
    expect(user.password).to be_a String
  end

end
