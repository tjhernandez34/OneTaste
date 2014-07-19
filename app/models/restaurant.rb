class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :images
  has_many :votes, as: :voteable
  belongs_to :creator, class_name: "User"

  def self.search(search)
    search.titleize!
    @restaurants = where('name LIKE ? OR category LIKE ? OR city LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def self.top_reviewers
    self.reviewers.sort_by {|reviewer| reviewer.points}
  end
  validates_uniqueness_of :street_address
  validates_presence_of :name, :state, :city
end
