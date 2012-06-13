require 'net/http'

class Document < ActiveRecord::Base
  attr_accessible :file, :filename, :remote_file_url, :user_id, :user_type,
                  :room_id, :user_display_name
  mount_uploader :file, FileUploader

  def self.create_and_broadcast(attributes, url)
    begin
      doc = Document.create!(attributes)
      doc.broadcast(url)
    rescue
      false
    end
  end

  def to_hash
    {
      room_id: room_id,
      user_name: user_display_name,
      user_id: user_id,
      user_type: user_type,
      message_type: self.class.name,
      body: file.url.to_s,
      metadata: {:filename => filename}
    }
  end

  def broadcast(url)
    # This  URL will be correct for PRODUCTION
    #uri = URI.parse("#{url}/api/v1/messages.json")
    uri = URI.parse("http://localhost:3000/api/v1/messages.json")
    Net::HTTP.post_form(uri, :message => to_hash.to_json)
    self
  end
end
