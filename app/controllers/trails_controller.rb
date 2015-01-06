class TrailsController < ApplicationController
  # GET /trails
  # GET /trails.json
  # skip_before_filter :verify_authenticity_token 
  def index
    @trails = Trail.all
 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trails, root: false  }
    end
  end

  # GET /trails/1
  # GET /trails/1.json
  def show
    @trail = Trail.find(params[:id])

    @uploader = User.find_by_id(@trail.user_id)
    if current_user
      @bookmark = current_user.bookmarks.find_by_trail_id(@trail.id)
      @favourites = @trail.bookmarks.where(favourited:true)
      @completeds = @trail.bookmarks.where(completed:true)
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trail, serializer: PointsSerializer, root: false  }
    end
  end

  # GET /trails/new
  # GET /trails/new.json
  def new
    @trail = Trail.new
    @trail.photos.build
    @trail.token = @trail.generate_token
    @photo = @trail.photos.build
    @photos = []

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trail }
    end
  end

  # GET /trails/1/edit
  def edit
    @trail = Trail.find(params[:id])
  end

  # POST /trails
  # POST /trails.json
  def create
    # @trail = Trail.new(params[:trail])
    filter = params.except(:action, :controller, :format, :null, :file, :authenticity_token, :rating)
    @trail = Trail.new(name:params[:name],county:params[:county],lat:params[:lat],lng:params[:lng],distance:params[:distance],user_id:current_user.id)

    respond_to do |format|
      if @trail.save

       params[:file].each do |file|
      
        if file.content_type === "image/jpeg"
          @trail.photos << Photo.create(image: file) 
       elsif file.content_type === "application/octet-stream"
     
        @trail.update_attributes(gpx:file)
      end
    end
 
    Bookmark.create(user_id:current_user.id,trail_id:@trail.id,favourited:true,rating:params[:rating])
    if @trail.photos.empty?
      @trail.photos << Photo.create(image: File.open(File.join(Rails.root.join('public'), 'boots2.jpg')))
    end
    

    format.json { render json: @trail, root: false  }
  else
    format.html { render action: "new" }
    format.json { render json: @trail.errors, status: :unprocessable_entity }
  end
end
end

  # PUT /trails/1
  # PUT /trails/1.json
  def update
Photo.where(trail_id:params[:id]).each do | photo|
  photo.name = "other"
end
# binding.pry
@photo = Photo.find_by_id(params[:photo])
@photo.name = "main"

    @trail = Trail.find(params[:id])
# @trail.photos = @trail.photos.order(:updated_at).reverse
# binding.pry
    respond_to do |format|
      if @trail.update_attributes(params[:trail])
        format.html { redirect_to @trail, notice: 'Trail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trails/1
  # DELETE /trails/1.json
  def destroy

    @trail = Trail.find(params[:id])
    @trail.destroy

    respond_to do |format|
      format.html { redirect_to trails_url }
      format.json { head :no_content }
    end
  end
end
