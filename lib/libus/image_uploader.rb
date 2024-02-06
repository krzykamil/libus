# frozen_string_literal: true
require 'shrine'

module Libus
  class ImageUploader < Hanami.app["shrine"]
    TYPES = %w[image/jpeg image/png image/webp].freeze
    EXTENSIONS = %w[jpg jpeg png webp].freeze
    MAX_SIZE = 5 * 1024 * 1024
    MIN_SIZE = 1024
    Attacher.validate do
      validate_size MIN_SIZE..MAX_SIZE # 1kB..5MB
      validate_mime_type ImageUploader::TYPES
    end
  end
end
