# frozen_string_literal: true

require "pathname"
SPEC_ROOT = Pathname(__dir__).realpath.freeze

ENV["HANAMI_ENV"] ||= "test"
require "hanami/boot"
require "pry"
require_relative "support/rspec"
require_relative "support/db"
require_relative "support/features"
require_relative "support/requests"
require 'sidekiq/testing'
require "rom/factory"

Sidekiq::Testing.inline!
