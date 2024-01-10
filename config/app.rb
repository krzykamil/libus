# frozen_string_literal: true

require "hanami"
require_relative '../lib/libus/middleware/auth'
require 'pry'

module Libus
  class App < Hanami::App
    config.shared_app_component_keys += ["redis", "db", "persistence.rom"]
    config.middleware.use Libus::Middleware::Auth
  end
end
