class Picture < ActiveRecord::Base
  attr_accessible :image, :remote_image_url
  
  mount_uploader :image, ImageUploader
end
