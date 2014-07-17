require 'spec_helper'

describe Review do
  context "validations" do
    it {should validate_presence_of :content }
    it {should validate_presence_of(:reviewer) }
  end

  context "associations" do
    it {should have_many :votes }
    it {should have_many :comments }
    it {should belong_to(:reviewer).class_name("User") }
    it {should belong_to :restaurant }
  end

  let(:review) { Review.create(reviewer_id: 1, restaurant_id: 1, content: "Good", title: "Tasty!")}

  it "should have a reviewer id" do
    expect(review.reviewer_id).to eq(1)
  end

  it "should have a restaurant_id" do
    expect(review.restaurant_id).to eq(1)
  end

  it "should have content" do
    expect(review.content).to eq("Good")
  end

  it "can have a title" do
    expect(review.title).to eq("Tasty!")
  end
end
