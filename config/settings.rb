# frozen_string_literal: true

module Libus
  class Settings < Hanami::Settings
    # Define your app settings here, for example:
    #
    setting :redis_url, default: "redis://localhost:6379", constructor: Types::String
  end
end
