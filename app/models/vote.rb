class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :voter, class_name: "User"

  validates_presence_of :voter_id
  validates_presence_of :voteable_id
  validates_presence_of :voteable_type
  validates :voteable_type, inclusion: { in: %w(Comment Review Restaurant) }
end

