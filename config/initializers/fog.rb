require './config/secret/amazon_keys.rb'
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => AMAZON_KEY,       # required
    :aws_secret_access_key  => AMAZON_SECRET,       # required
  }
  config.fog_directory  = 'skinnyfiles'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000', 'Expires' => 99.years.from_now.httpdate}  # optional, defaults to {}
end