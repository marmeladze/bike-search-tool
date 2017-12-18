class BikeTag < ActiveRecord::Base
  belongs_to :bike
  belongs_to :tag
end
