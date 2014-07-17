require 'spec_helper'

describe Vote do

  it "should fail if voter is not present" do
    vote = Vote.create
    expect(vote.valid?).to be(false)
  end

  let(:vote) { Vote.create(voter_id: 1, restaurant_id: 1) }
  let(:vote2) { Vote.create(voter_id: 1, comment_id: 1) }
  let(:vote3) { Vote.create(voter_id: 1, review_id: 1) }

  it "should have a voter" do
    expect(vote.voter_id).to eq(1)
  end

  it "could have an restaurant" do
    expect(vote.restaurant_id).to eq(1)
  end

  it "could have a comment" do
    expect(vote2.comment_id).to eq(1)
  end

  it "could have a review" do
    expect(vote3.review_id).to eq(1)
  end

  context "validations" do
    it { should validate_presence_of :voter }
  end

  context "associations" do
    it { should belong_to :review }
    it { should belong_to :comment }
    it { should belong_to :restaurant }
    it { should belong_to(:voter).class_name("User") }
  end

end
