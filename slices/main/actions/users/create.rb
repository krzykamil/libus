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
          halt 422, { errors: "Password must match the confirmation" }.to_json unless request.params[:password] == request.params[:password_confirmation]
          halt 422, { errors: "This email is already taken" }.to_json if users_repo.email_taken?(request.params[:email])


          password_salt = BCrypt::Engine.generate_salt
          password_hash = BCrypt::Engine.hash_secret(request.params[:password], password_salt)
          users_repo.create(
            name: request.params[:name],
            email: request.params[:email],
            password_hash: password_hash,
            password_salt: password_salt
          )
        end
      end
    end
  end
end
