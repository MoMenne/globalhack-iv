class FrameController < ApplicationController

  def show_frame
    binding.pry
    @image = Image.all.first
  end

end
