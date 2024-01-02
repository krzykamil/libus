# frozen_string_literal: true

source "https://rubygems.org"

gem "hanami", "~> 2.1.0.rc"
gem "hanami-router", "~> 2.1.0.rc"
gem "hanami-controller", "~> 2.1.0.rc"
gem "hanami-validations", "~> 2.1.0.rc"
gem "hanami-view", "~> 2.1.0.rc"
gem "hanami-assets", "~> 2.1.0.rc"

gem "dry-types", "~> 1.0", ">= 1.6.1"
gem "dry-effects"
gem "dry-struct"
gem "puma"
gem "rake"
gem "redis"
gem "sidekiq"
gem "rom", "~> 5.3"
gem "rom-sql", "~> 3.6"
gem "pg"

group :development do
  gem "hanami-webconsole", "~> 2.1.0.rc"
  gem "guard-puma"
end

group :development, :test do
  gem "dotenv"
  gem "pry"
end

group :cli, :development do
  gem "hanami-reloader", "~> 2.1.0.rc"
end

group :cli, :development, :test do
  gem "hanami-rspec", "~> 2.1.0.rc"
end

group :test do
  gem "capybara"
  gem "rack-test"
  gem "database_cleaner-sequel"
  gem "rom-factory"
end
