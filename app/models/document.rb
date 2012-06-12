class Document < ActiveRecord::Base
  attr_accessible :file, :remote_file_url, :user_id, :user_type, :room_id, :user_display_name
  
  mount_uploader :file, FileUploader
  after_create :broadcast

  def to_hash
    {
      room_id: room_id,
      user_name: user_display_name,
      user_id: user_id,
      user_type: user_type,
      message_type: self.class.name,
      message_body: file.url,
      metadata: { },
      created_at: created_at,
    }
  end

  def channel
    "/messages/#{room_id}"
  end

  def broadcast
    message_hash = {:channel => channel, 
                    :data => { :chat_message => self.to_hash } }
    uri = URI.parse("#{FAYE_URL}/faye")
    Net::HTTP.post_form(uri, :message => message_hash.to_json)
  end
end
