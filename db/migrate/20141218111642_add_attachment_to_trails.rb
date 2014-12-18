class AddAttachmentToTrails < ActiveRecord::Migration
  def change
    add_attachment :trails, :gpx
  end
end
