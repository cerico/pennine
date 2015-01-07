class Trail < ActiveRecord::Base
  attr_accessible :county, :description, :distance, :lat, :lng, :name, :postcode, :rating, :user_id, :gpx

  has_many :bookmarks
  has_many :photos
  has_many :comments
  belongs_to :user
  accepts_nested_attributes_for :photos, allow_destroy: true

  has_many :tracksegments, :dependent => :destroy
  has_many :points, :through => :tracksegments

  has_attached_file :gpx

  validates :name, presence: true

  validates :lat, presence: true
  validates :lng, presence: true

       validates_format_of :name, :with => /\A[A-Za-z0-9 \-]*\z/,
        :message => "can only contain letters, numbers, spaces, and hyphens"

       validates_format_of :county, :with => /\A[A-Za-z0-9 \-]*\z/,
        :message => "can only contain letters, numbers, spaces, and hyphens"

      validates_format_of :description, :with => /\A[A-Za-z0-9 \-]*\z/,
        :message => "can only contain letters, numbers, spaces, and hyphens"

              validates_format_of :postcode, :with => /\A[A-Za-z0-9 \-]*\z/,
        :message => "can only contain letters, numbers, spaces, and hyphens"


        validates_numericality_of :lat
        validates_numericality_of :lng
        # validates_numericality_of :rating
        validates_numericality_of :user_id
        validates_numericality_of :distance


  before_save :parse_gpx

  def active_model_serializer
      IndexSerializer
  end

  def parse_gpx

    if gpx.queued_for_write[:original]   
     tempfile = gpx.queued_for_write[:original]
     doc = Nokogiri::XML(tempfile)
     parse_xml(doc)
   end
end

def parse_xml(doc)
  doc.root.elements.each do |node|
    parse_tracks(node)
  end
end

def parse_tracks(node)

 if node.node_name.eql? 'trk'
   node.elements.each do |node|
     parse_track_segments(node)
   end
 end
 if node.node_name.eql? 'rte'
   node.elements.each do |node|
     parse_track_segments2(node)
   end
 end
end

def parse_track_segments(node)
  if node.node_name.eql? 'trkseg'
    tmp_segment = Tracksegment.new
    node.elements.each do |node|
      parse_points(node,tmp_segment)
    end
    self.tracksegments << tmp_segment
  end
end

def parse_track_segments2(node)
 if node.node_name.eql? 'rtept'
   tmp_segment = Tracksegment.new          
   parse_points2(node,tmp_segment)             
   self.tracksegments << tmp_segment
 end
end

def parse_points(node,tmp_segment)

  if node.node_name.eql? 'trkpt'
    tmp_point = Point.new
    tmp_point.latitude = node.attr("lat")
    tmp_point.longitude = node.attr("lon")
    node.elements.each do |node|
      tmp_point.name = node.text.to_s if node.name.eql? 'name'
      tmp_point.elevation = node.text.to_s if node.name.eql? 'ele'
      tmp_point.description = node.text.to_s if node.name.eql? 'desc'
      tmp_point.point_created_at = node.text.to_s if node.name.eql? 'time'
    end
    tmp_segment.points << tmp_point
  end
end

def parse_points2(node,tmp_segment)

  if node.node_name.eql? 'rtept'
    tmp_point = Point.new
    tmp_point.latitude = node.attributes["lat"].value
    tmp_point.longitude = node.attributes["lon"].value
    node.elements.each do |node|
      tmp_point.name = node.text.to_s if node.name.eql? 'name'
      tmp_point.elevation = node.text.to_s if node.name.eql? 'ele'
      tmp_point.description = node.text.to_s if node.name.eql? 'desc'
      tmp_point.point_created_at = node.text.to_s if node.name.eql? 'time'
    end
    tmp_segment.points << tmp_point
  end

end


end
