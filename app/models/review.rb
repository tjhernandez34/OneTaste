class Review < ActiveRecord::Base
  has_many :votes, as: :voteable
  has_many :comments
  belongs_to :reviewer, class_name: "User"
  belongs_to :restaurant

  validates_presence_of :content
  validates_presence_of :reviewer
end
