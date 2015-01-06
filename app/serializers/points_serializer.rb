class PointsSerializer < ActiveModel::Serializer
  attributes :id, :name, :county, :rating, :user_id, :distance, :lat, :lng, :hikerbookmark, :hiker, :mainphoto

  has_many :bookmarks
  has_many :photos
  has_one :user

  has_many :points
  

  def hikerbookmark
    scope.bookmarks.find_by_trail_id(object) if scope
  end

  def mainphoto
    if photos.find_by_name("main")
    photos.find_by_name("main")
  else
    photos.first
  end
  end

  
  def hiker
    scope
  end
end
