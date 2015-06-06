class ImagesController < ApplicationController
  before_filter :allow_iframe_requests

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id]) 
  end

  def create 
    @image = Image.new(image_params)
      respond_to do |format|
        if @image.save
          format.html { redirect_to images_path, notice: 'Uploaded your image' }
        else
          format.html { render @image, notice: 'err... thats not right' }
        end

      end
  end

  private
  def image_params
    params.require(:image).permit(:name, :image_file, :text)
  end
  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end
end
