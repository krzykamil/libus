# frozen_string_literal: true

module Libus
  class Settings < Hanami::Settings
    setting :redis_url, default: "redis://localhost:6379", constructor: Types::String
    setting :database_url, constructor: Types::String
    setting :session_secret, constructor: Types::String
    setting :s3_bucket, constructor: Types::String
    setting :s3_region, constructor: Types::String
    setting :s3_access_key_id, constructor: Types::String
    setting :s3_secret_access_key, constructor: Types::String
  end
end
