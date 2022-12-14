CarrierWave.configure do |config|
    require 'carrierwave/storage/abstract'
    require 'carrierwave/storage/file'
    require 'carrierwave/storage/fog'
  
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
        region:                'ap-northeast-1',
        path_style:            true,
    }
  
    config.fog_public     = false
    config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
  
    case Rails.env
      when 'production'
        config.fog_directory = 'reason-production'
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/reason-production'
      when 'development'
        config.fog_directory = 'reason-development'
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/reason-development'
    end
  end