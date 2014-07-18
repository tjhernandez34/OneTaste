require 'carrierwave/orm/activerecord'

class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :owner, class_name: "User"
  belongs_to :restaurant
end
