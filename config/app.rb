# frozen_string_literal: true

require "hanami"
require "hanami/middleware/body_parser"
module Libus
  class App < Hanami::App
    config.middleware.use Hanami::Middleware::BodyParser, :form
    config.shared_app_component_keys += %w[shrine redis db persistence.rom]
  end
end
