require 'carrierwave/orm/activerecord'

class User < ActiveRecord::Base
  has_secure_password
  mount_uploader :avatar, AvatarUploader

  has_many :reviews, foreign_key: "reviewer_id"
  has_many :points, through: :reviews, source: :votes
  has_many :comments, foreign_key: "commenter_id"
  has_many :restaurants, foreign_key: "creator_id"
  has_many :votes_cast, class_name: "Vote", foreign_key: "voter_id"
  has_many :images
  has_many :friendships
  has_many :friends, through: :friendships


  validates_presence_of :username, :email, :password
  validates_uniqueness_of :username, :email
  validates :password, :length => {:minimum => 6, :message => "Password must be at least 6 characters"}

end
