class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.json
  skip_before_filter :verify_authenticity_token
  def index
    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create


    if params[:file].content_type === "image/jpeg"

      @photo = Photo.new(trail_id: params[:trail_id],image: params[:file])
      respond_to do |format|
        if @photo.save
          format.json{ render :json => @photo }
        else
          format.json { render json: @photo.errors, status: :unprocessable_entity }
        end
      end
    elsif params[:file].content_type === "application/octet-stream"
      @trail = Trail.find(params[:trail_id])
      respond_to do |format|
        if @trail.update_attributes(gpx:params[:file])
          format.json { render :json => @trail, root: false}
        end
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end
end
