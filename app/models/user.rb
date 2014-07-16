class User < ActiveRecord::Base
  has_many :reviews, foreign_key: "reviewer_id"
  has_many :points, through: :reviews, source: :votes
  has_many :comments, foreign_key: "commenter_id"
  has_many :restaurants, foreign_key: "creator_id"
  has_many :votes_cast, class_name: "Vote", foreign_key: "voter_id"
end
