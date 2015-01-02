class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter  :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
  	
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

protected

  def verified_request?

    super || form_authenticity_token == request.headers['X_XSRF_TOKEN']
  end 

  helper_method :distance_calc

  def distance_calc(completedhikes)
    totaldistance = 0
    completedhikes.each do |hike|
      totaldistance += hike.trail.distance
    end
    totaldistance
  end


end
