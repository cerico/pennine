class Bookmark < ActiveRecord::Base
  attr_accessible :completed, :favourited, :rating, :trail_id, :user_id
end
