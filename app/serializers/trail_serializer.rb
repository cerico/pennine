class TrailSerializer < ActiveModel::Serializer
  attributes :id, :name, :county, :rating, :user_id, :distance, :lat, :lng, :hikerbookmark, :hiker

  has_many :bookmarks
  has_many :photos
  has_one :user
  # has_many :tracksegments
  #has_many :points
  

  def hikerbookmark
    scope.bookmarks.find_by_trail_id(object) if scope
  end

  def hiker
    scope
  end
end
