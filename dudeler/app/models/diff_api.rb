require 'httparty'

class DiffApi

  def self.find_differences(image1, image2)
    #image1_path = 'dudeler/public' + image1.image_file_url
    #image2_path = 'dudeler/public' + image2.image_file_url
    # contour difference script is broken
    #%x(/home/mike/Code/globalhack-iv/gh4_img_diff.py #{image1_path} #{image2_path} 5)
    return [{x: 100, y: 100}, {x:50, y:100}, {x:100,y:50},{x:101,y:102}]
  end


end
