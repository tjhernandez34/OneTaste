class Comment < ActiveRecord::Base
  has_many :votes
  has_many :replies, class_name: "Comment", foreign_key: "parent_id"
  belongs_to :review
  belongs_to :parent, class_name: "Comment"
  belongs_to :commenter, class_name: "User"
end
