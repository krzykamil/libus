# frozen_string_literal: true

require "hanami"
require "warden"
require "hanami/middleware/body_parser"

module Libus
  class App < Hanami::App
    config.actions.sessions = :cookie, {
      key: "libus.session",
      secret: settings.session_secret,
      expire_after: 60*60*24*365
    }
    config.middleware.use Warden::Manager do |manager|
      manager.default_strategies :password
      manager.failure_app =
        lambda do |env|
          Libus::Actions::AuthFailure::Show.new.call(env)
        end
    end
    config.shared_app_component_keys += ["redis", "db", "persistence.rom", "shrine"]
    config.middleware.use Hanami::Middleware::BodyParser, :form
  end
end
