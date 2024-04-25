# frozen_string_literal: true

require 'bcrypt'

module Main
  module Actions
    module Users
      class Create < Main::Action
        include Deps[users_repo: "repositories.users"]

        params do
          required(:email).filled(:string)
          required(:name).filled(:string)
          required(:password).filled(:string)
          required(:password_confirmation).filled(:string)
        end

        def handle(request, response)
          halt 422, {errors: request.params.errors}.to_json unless request.params.valid?

          if request.params[:password] != request.params[:password_confirmation]
            response.flash[:alert] = "Password must match the confirmation"
            response.redirect_to routes.path(:register)
          end
          if users_repo.email_taken?(request.params[:email])
            response.flash[:alert] = "This email is already taken"
            response.redirect_to routes.path(:register)
          end

          password_salt = BCrypt::Engine.generate_salt
          password_hash = BCrypt::Engine.hash_secret(request.params[:password], password_salt)
          user = users_repo.create(
            name: request.params[:name],
            email: request.params[:email],
            password_hash: password_hash,
            password_salt: password_salt
          )

          if user
            request.env['warden'].set_user(user)
            response.flash[:notice] = "Welcome to Libus #{user.name}!"
            response.redirect(routes.path(:root))
          else
            response.flash.now[:alert] = "There was an error"
          end
        end
      end
    end
  end
end
