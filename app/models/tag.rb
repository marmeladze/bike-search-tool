class Tag < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :bike_tags
  has_many :bikes, through: :bike_tags
end
