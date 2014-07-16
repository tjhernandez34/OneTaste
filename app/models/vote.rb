class Vote < ActiveRecord::Base
  belongs_to :review
  belongs_to :comment
  belongs_to :restaurant
  belongs_to :voter, class_name: "User"
end
