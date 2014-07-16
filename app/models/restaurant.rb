class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :votes
  belongs_to :creator, class_name: "User"
end
