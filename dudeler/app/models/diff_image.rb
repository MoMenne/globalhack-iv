class DiffImage < ActiveRecord::Base

  belongs_to :photo_hunt
  mount_uploader :image_file, ImageUploader


end
