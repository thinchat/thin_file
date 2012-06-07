CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV['AMAZON_KEY'],       # required
    :aws_secret_access_key  => ENV['AMAZON_SECRET'],       # required
  }
  config.fog_directory  = 'skinnyfiles'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end