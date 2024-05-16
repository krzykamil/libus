# frozen_string_literal: true

module Libus
  module Entities
    class Book < ROM::Struct
      include Libus::ImageUploader::Attachment(:image)
      attr_writer :image_data
    end
  end
end

