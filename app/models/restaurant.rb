class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :votes
  belongs_to :creator, class_name: "User"

  validates_uniqueness_of :street_address
  validates_presence_of :name, :state, :city
end
