class Bookmark < ActiveRecord::Base
  attr_accessible :completed, :favourited, :rating, :trail_id, :user_id

  belongs_to :trail
  belongs_to :user
end
