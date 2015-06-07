class DifferencePointsController < ApplicationController
  before_filter :allow_iframe_requests

  def create
    binding.pry
    respond_to do |format|
        format.json { json: @difference_points }
    end
  end


  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end

end
