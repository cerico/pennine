class Photo < ActiveRecord::Base
  attr_accessible :image, :name, :trail_id, :user_id

  mount_uploader :image, TrailPhotoUploader
end
