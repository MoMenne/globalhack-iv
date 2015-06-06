class FramesController < ApplicationController
  before_filter :allow_iframe_requests

  def index
    content_id = parse_content_id(request)
    binding.pry
    @image = Image.find_by_content_id(content_id)
  end

  private
  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end
  def parse_content_id(request)
    JSON.parse(URI.unescape(request.url.split('?')[1]))["args"]["id"]
  end
end
