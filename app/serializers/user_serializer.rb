class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :photo, :distance

  has_many :bookmarks
  has_many :trails


  def distance
    totaldistance = 0
    bookmarks.where(completed:true).each do |hike|
      totaldistance += hike.trail.distance
    end
    totaldistance
  end
end