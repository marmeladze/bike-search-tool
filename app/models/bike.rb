class Bike < ActiveRecord::Base
	validates :name, :manufacturer_url, presence: true
  validates  :name, uniqueness: true

  has_many :bike_tags
  has_many :tags, through: :bike_tags

  def all_tags= (names)
    self.tags = names.split(", ").map do |name|
      Tag.where(name: name.strip.downcase!).first_or_create!
    end
  end

  def all_tags 
    self.tags.map(&:name).join(", ")
  end

end
