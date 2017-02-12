require 'carrierwave/datamapper'

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
end

class Picture
  include DataMapper::Resource

  property :id,   Serial
  mount_uploader :source, ImageUploader

  belongs_to :space
end
