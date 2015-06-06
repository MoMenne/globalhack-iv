class FramesController < ApplicationController
  before_filter :allow_iframe_requests

  def index
    @image = Image.all.first
  end

  private
  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end
end
