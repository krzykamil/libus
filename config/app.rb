# frozen_string_literal: true

require "hanami"

module Libus
  class App < Hanami::App
    config.shared_app_component_keys += ["redis"]
  end
end
