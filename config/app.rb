# frozen_string_literal: true

require "hanami"
require "warden"

module Libus
  class App < Hanami::App
    config.middleware.use Rack::Session::Cookie, :secret => "WILLCHANGETOSECRET", :key => "libus.session"
    config.middleware.use Warden::Manager do |manager|
      manager.default_strategies :password
      manager.failure_app =
        lambda do |env|
          Libus::Actions::AuthFailure::Show.new.call(env)
        end
    end
    config.shared_app_component_keys += ["redis", "db", "persistence.rom"]
  end
end
