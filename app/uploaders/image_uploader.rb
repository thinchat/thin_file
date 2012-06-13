# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :fog

  # def store_dir
  #   "http://thin.s3-website-us-east-1.amazonaws.com/"
  # end


  version :thumbnail do
    process :resize_to_limit => [50, 50]
  end

  version :medium_size do
    process :resize_to_limit => [250, 250]
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
