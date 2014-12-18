class Tracksegment < ActiveRecord::Base
  belongs_to :trail
  has_many :points, :dependent => :destroy
end
