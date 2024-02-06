# frozen_string_literal: true

module Libus
  module Persistence
    module Relations
      class Storages < ROM::Relation[:sql]
        include ImageUploader::Attachment[:images]
        schema(:storages, infer: true)
      end
    end
  end
end

