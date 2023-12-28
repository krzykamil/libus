# frozen_string_literal: true

require 'dry-effects'

module Libus
  class HandleDownloads
    include Dry::Effects::Handler.Defer(executor: :fast)
    def initialize(app)
      @app = app
    end

    def call(env)
      with_defer { @app.(env) }
    end
  end
end
