# frozen_string_literal: true

require "hanami/rake_tasks"
require "rom/sql/rake_task"
require "bcrypt"
require "hanami/setup"
require "rom-repository"
require "hanami/boot"

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


# seeding for users and roles
#

def create_roles
  binding.pry
  roles_repo = Libus::App["repositories.roles"]

  roles_repo.create(name: "basic_user")
  roles_repo.create(name: "admin_user")
end

def create_users
  users_repo = Libus::App["repositories.users"]
  roles_repo = Libus::App["repositories.roles"]

  admin_user_role_repo = roles_repo.by_name("admin_user")
  password_salt = BCrypt::Engine.generate_salt
  password_hash = BCrypt::Engine.hash_secret("haslo123", password_salt)
  users_repo.create(
    name: "adminik",
    email: "admin@gmail.com",
    password_hash: password_hash,
    password_salt: password_salt,
    role_id: admin_user_role_repo.id
  )

  basic_user_role_repo = roles_repo.by_name("basic_user")
  password_salt = BCrypt::Engine.generate_salt
  password_hash = BCrypt::Engine.hash_secret("haslo123", password_salt)
  users_repo.create(
    name: "adminik",
    email: "admin@gmail.com",
    password_hash: password_hash,
    password_salt: password_salt,
    role_id: basic_user_role_repo.id
  )
end

def create_permissions
  permissions_repo = Libus::App["repositories.permissions"]
  roles_repo = Libus::App["repositories.roles"]

  basic_user_role_repo = roles_repo.by_name("basic_user")
  permissions_repo.create(name: "browse library", role_id: basic_user_role_repo.id)

  admin_user_role_repo = roles_repo.by_name("admin_user")
  permissions_repo.create(name: "browse admin", role_id: admin_user_role_repo.id)
end


namespace :db do
  desc "Seed base (users, roles, permissions)"
  task :seed do

    create_roles
    create_users
    create_permissions

    puts "Seeded roles, users and permissions"
  end
end




