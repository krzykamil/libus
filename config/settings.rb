# frozen_string_literal: true

module Libus
  class Settings < Hanami::Settings
    setting :redis_url, default: "redis://localhost:6379", constructor: Types::String
    setting :database_url, constructor: Types::String
    setting :session_secret, constructor: Types::String
  end
end
