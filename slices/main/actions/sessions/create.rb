# frozen_string_literal: true

require 'pry'

module Main
  module Actions
    module Sessions
      class Create < Main::Action
        include Deps[users_repo: "repositories.users"]

        params do
          required(:email).filled(:string)
          required(:password).filled(:string)
        end

        def handle(request, response)
          halt 422, {errors: request.params.errors}.to_json unless request.params.valid?

          request.env['warden'].authenticate!

          user = users_repo.by_email(request.params[:email])

          if user && user.password_hash == BCrypt::Engine.hash_secret(request.params[:password], user.password_salt)
            request.session[:user_id] = user.id
            response.redirect "/"
          else
            halt 401, "Unauthorized"
          end
        end
      end
    end
  end
end
