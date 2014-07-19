require 'spec_helper'

describe Vote do

  it "should fail if voter is not present" do
    vote = Vote.create
    expect(vote.valid?).to be(false)
  end

  let(:vote) { Vote.create(voter_id: 1, voteable_id: 1, voteable_type: "restaurant") }
  let(:vote2) { Vote.create(voter_id: 1, voteable_id: 2, voteable_type: "comment") }
  let(:vote3) { Vote.create(voter_id: 1, voteable_id: 3, voteable_type: "review") }

  it "should have a voter" do
    expect(vote.voter_id).to eq(1)
  end

  it "could have an restaurant" do
    expect(vote.voteable_type).to eq("restaurant")
  end

  it "could have a comment" do
    expect(vote2.voteable_type).to eq("comment")
  end

  it "could have a review" do
    expect(vote3.voteable_type).to eq("review")
  end

  it "cannot have any other voteable type" do
    vote4 = Vote.create(voter_id: 1, voteable_id: 4, voteable_type: "banana")
    expect(vote4.valid?).to be_false
  end

  context "validations" do
    it { should validate_presence_of :voter_id }
    it { should validate_presence_of :voteable_id }
    it { should validate_presence_of :voteable_type }
  end

  context "associations" do
    it { should belong_to :voteable }
    it { should belong_to(:voter).class_name("User") }
  end

end
