class PhotoHuntsController < ApplicationController
  before_filter :allow_iframe_requests

  def index
    @photo_hunts = PhotoHunt.all
  end

  def new
    @photo_hunt = PhotoHunt.new
  end

  def show
    @photo_hunt = PhotoHunt.find(params[:id])
  end
  
  def edit
    @photo_hunt = PhotoHunt.find(params[:id])
  end

  def update
    @photo_hunt = PhotoHunt.new(photo_hunt_params)
    respond_to do |format|
      if @photo_hunt.save
        @photo_hunt.update(base_image: @base_image)
        @photo_hunt.update(diff_image: @diff_image)
        format.html { redirect_to photo_hunts_path, notice: 'Your photo hunt has been uploaded' }
      else 
        format.html { render @photo_hunt, notice: 'err... something is not right' }
      end
    end
  end

  def update_difference_points 
    @photo_hunt = PhotoHunt.find params[:photo_hunt_id]
    @photo_hunt.difference_point.delete_all
    params["photo_hunt"]["difference_points"].values.each do |group|
      DifferencePoint.create(x: group["x"], y: group["y"], photo_hunt: @photo_hunt)
    end 
    render json: @photo_hunt, status: 201
  end

  def create
    @photo_hunt = PhotoHunt.new(photo_hunt_params)
    @base_image = BaseImage.new(base_image_params)
    @diff_image = DiffImage.new(diff_image_params)
    respond_to do |format|
      if @photo_hunt.save
        @photo_hunt.update(base_image: @base_image)
        @photo_hunt.update(diff_image: @diff_image)
        format.html { redirect_to edit_photo_hunt_path(@photo_hunt), notice: 'Your photo hunt has been uploaded' }
      else 
        format.html { render @photo_hunt, notice: 'err... something is not right' }
      end
    end
  end

  private
  def photo_hunt_params
    params.require(:photo_hunt).permit(:name)
  end

  def base_image_params
    params.require(:base_image).permit(:image_file)
  end

  def diff_image_params
    params.require(:diff_image).permit(:image_file)
  end

  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end
end
