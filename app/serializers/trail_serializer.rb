class TrailSerializer < ActiveModel::Serializer
  attributes :id, :name, :county, :rating, :user_id, :distance, :lat, :lng, :userbookmark, :user

  has_many :bookmarks

  def userbookmark
    scope.bookmarks.find_by_trail_id(object) if scope
  end

  def user
    scope
  end
end
