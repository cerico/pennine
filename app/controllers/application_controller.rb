class ApplicationController < ActionController::Base
  protect_from_forgery



  helper_method :distance_calc

  def distance_calc(completedhikes)
    totaldistance = 0
    completedhikes.each do |hike|
      totaldistance += hike.trail.distance
    end
    totaldistance
  end


end
