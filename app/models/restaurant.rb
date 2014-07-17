class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :votes
  belongs_to :creator, class_name: "User"

  def self.search(search)
    @restaurants = where('name LIKE ? OR category LIKE ?', "%#{search}%", "%#{search}%")
  end

end
