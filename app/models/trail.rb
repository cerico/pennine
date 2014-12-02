class Trail < ActiveRecord::Base
  attr_accessible :county, :description, :distance, :lat, :lng, :name, :postcode, :rating, :user_id

  has_many :bookmarks
  has_many :photos
  has_many :comments
  belongs_to :user
  accepts_nested_attributes_for :photos, allow_destroy: true
end
