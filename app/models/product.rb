class Product < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, :manufacturer_url, presence: true

  def features_list
    self.features.join(" ")
  end

  def features_list=(text)
    self.features = []
    text.split(" ").map(&:downcase).uniq.each do |f|
      self.features << f.presence
    end
    save!
  end

  def matched_against ary
    features & ary
  end

  def score_for ary
    (1.0*matched_against(ary).size/(ary.size)).round(2)
  end

  private 

  def uniquize_features!

  end
end
