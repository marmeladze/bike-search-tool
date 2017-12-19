class Product < ActiveRecord::Base
  #before_save :uniquize_features!
  validates :name, uniqueness: true
  validates :name, :manufacturer_url, presence: true

  def matched_against ary
    features & ary
  end

  def score_for ary
    (1.0*matched_against(ary).size/(ary.size)).round(2)
  end

  private 

  def uniquize_features!
    all_features = features.uniq!
    update_attributes!(features: all_features)
  end
end
