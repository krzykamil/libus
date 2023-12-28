# frozen_string_literal: true

Hanami.app.register_provider(:sidekiq) do
  prepare do
    require "sidekiq"
  end

  start do
    target.start(:redis)
  end
end
