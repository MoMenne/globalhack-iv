class PhotoHunt < ActiveRecord::Base
  after_create :save_points
  after_create :post_to_lockerdome

  has_one :diff_image
  has_one :base_image
  has_many :difference_point
  accepts_nested_attributes_for :difference_point
  accepts_nested_attributes_for :base_image
  accepts_nested_attributes_for :diff_image
 
  def output_points
    # there's a better to doing this ... it's just late
    point_json = "["
    difference_point.all.each do |point|
      point_json = point_json + "{x: #{point[:x]}, y: #{point[:y]} },"
    end
    point_json = point_json[0..-1]
    point_json = point_json + "]"
  end

  def post_to_lockerdome
    response = LdApi.app_create_content(id, name, '')
    self.content_id =  parse_content_id response
    save
  end
 
  
  private
  def parse_content_id(response)
    JSON.parse(response.body)["result"]["id"]
  end

  def save_points 
    DiffApi.find_differences(diff_image, base_image).each do |point|
      DifferencePoint.create(x: point[:x].round, y: point[:y].round, photo_hunt_id: id) 
    end
  end
end
