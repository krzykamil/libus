# frozen_string_literal: true
require 'roda'
require 'bcrypt'
require 'sequel/core'

module Libus
  module Middleware
    class Auth <  Roda
      DB = Sequel.connect(ENV['DATABASE_URL'])
      plugin :middleware
      plugin :rodauth do
        enable :login
      end
      plugin :render, escape: :erubi, check_paths: true, views: 'slices/auth/templates/layouts'
      plugin :sessions, secret: ENV['APP_SESSION_SECRET'] # You're missing a session handler, try using the sessions plugin.

      route do |r|
        env['rodauth'] = rodauth
        r.rodauth
      end
    end
  end
end

module Rodauth
  module Login
    def login_view
      ::Auth::Views::Login::Index.new.call(roda_request: request).to_s
    end
  end

  module Logout
    def logout_view
      ::Auth::Views::Logout::Index.new.call.to_s
    end
  end
end
