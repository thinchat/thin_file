class Document < ActiveRecord::Base
  attr_accessible :file, :remote_file_url
  
  mount_uploader :file, FileUploader
end
