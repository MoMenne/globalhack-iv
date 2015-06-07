class Image < ActiveRecord::Base
  after_create :post_to_lockerdome

  belongs_to :photo_hunt
  mount_uploader :image_file, ImageUploader

  def post_to_lockerdome
    response = LdApi.app_create_content(id, name, text)
    self.content_id =  parse_content_id response
    save
  end
 
  
  def parse_content_id(response)
    JSON.parse(response.body)["result"]["id"]
  end
end
