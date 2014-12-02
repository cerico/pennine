class Trail < ActiveRecord::Base
  attr_accessible :county, :description, :distance, :lat, :lng, :name, :postcode, :rating, :user_id
end
