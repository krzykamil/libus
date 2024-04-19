# frozen_string_literal: true

module Libus
  module Persistence
    module Entities
      class Book < ROM::Struct
        include ImageUploader::Attachment(:image)
      end
    end
  end
end

