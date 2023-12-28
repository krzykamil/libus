# frozen_string_literal: true
require 'pry'
Hanami.app.register_provider(:redis) do
  prepare do
    require "redis"
  end

  start do
    client ||= ConnectionPool::Wrapper.new do
      Redis.new(url: target["settings"].redis_url)
    end

    register "redis", client
  end
end
