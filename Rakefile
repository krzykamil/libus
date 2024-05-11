# frozen_string_literal: true

require "hanami/rake_tasks"
require "rom/sql/rake_task"

namespace :tailwind do
  desc "Compile your Tailwind CSS"
  task :compile do
    system(
      "npx",
      "tailwindcss",
      "--input", "slices/main/assets/css/tailwind.css",
      "--output", "slices/main/assets/builds/tailwind.css",
      "--minify"
    )
  end

  desc "Watch and compile your Tailwind CSS on file changes"
  task :watch do
    system(
      "npx",
      "tailwindcss",
      "--input", "slices/main/assets/css/tailwind.css",
      "--output", "slices/main/assets/builds/tailwind.css",
      "--minify",
      "--watch"
    )
    system(
      "npx",
      "tailwindcss",
      "--input", "slices/admin/assets/css/tailwind.css",
      "--output", "slices/admin/assets/builds/tailwind.css",
      "--minify",
      "--watch"
    )
  end
end

task :environment do
  require_relative "config/app"
  require "hanami/prepare"
end

namespace :db do
  task setup: :environment do
    Hanami.app.prepare(:persistence)
    ROM::SQL::RakeSupport.env = Hanami.app["persistence.config"]
  end
end
