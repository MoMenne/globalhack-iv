class PhotoHunt < ActiveRecord::Base
  after_create :save_points

  has_one :diff_image, class_name: 'Image'
  has_one :base_image, class_name: 'Image'
  has_many :difference_point

  def save_points 
    DiffApi.find_differences(diff_image, base_image).each do |point|
      DifferencePoint.create(x: point[:x].round, y: point[:y].round, photo_hunt_id: id) 
    end
  end
end
