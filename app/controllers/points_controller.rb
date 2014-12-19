class PointsController < ApplicationController
  def index
    @points = Point.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @points}
    end
  end

end
