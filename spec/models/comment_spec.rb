require 'spec_helper'

describe Comment do
  context "validations" do
    it { should validate_presence_of :content }
    it { should validate_presence_of :review_id }
  end

  context "associations" do
    it { should have_many :votes }
    it { should have_many(:replies).with_foreign_key("parent_id").class_name("Comment") }
    it { should belong_to :review }
    it { should belong_to(:parent).class_name("Comment") }
    it { should belong_to(:commenter).class_name("User") }
  end


      let(:user) { User.create(username: "hans", email: "han@solo.com", password: "password") }
      let(:vote) { Vote.create(voter: user) }
      let(:reply) { Comment.create(commenter: user, content: "Goodbye!") }
      let(:comment) { Comment.create(commenter: user, content: "Hello!", review_id: 1)}

    it "should have a commenter" do
      expect(comment.commenter).to eq(user)
    end

    it "should have given content" do
      expect(comment.content).to eq("Hello!")
    end

    it "should be tied to its votes" do
      comment.votes << vote
      expect(comment.votes.length).to eq(1)
    end

    it "should be tied to its replies" do
      comment.replies << reply
      expect(comment.replies[0]).to eq(reply)
    end

    it "should point back to a parent comment if it is a reply" do
      comment.replies << reply
      expect(reply.parent).to eq(comment)
    end

    it "should belong to a review" do
      expect(comment.review_id).to eq(1)
    end

end
