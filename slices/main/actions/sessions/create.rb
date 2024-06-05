# frozen_string_literal: true

module Main
  module Actions
    module Sessions
      class Create < Main::Action
        include Deps[container: "persistence.rom"]

        params do
          required(:email).filled(:string)
          required(:password).filled(:string)
        end

        def handle(request, response)
          halt 422, {errors: request.params.errors}.to_json unless request.params.valid?

          user_repo = Libus::Repositories::Users.new(Hanami.app["persistence.rom"])

          user = user_repo.basic_user_by_email?(request.params[:email])

          if user && user.password_hash == BCrypt::Engine.hash_secret(request.params[:password], user.password_salt)
            request.session[:user_id] = user.id
            request.env['warden'].authenticate!
            response.redirect "/"
          else
            halt 401, "Unauthorized"
          end
        end
      end
    end
  end
end
