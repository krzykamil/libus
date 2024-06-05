# frozen_string_literal: true

module Admin
  module Actions
    module Sessions
      class Create < Admin::Action
        include Deps[container: "persistence.rom"]

        params do
          required(:email).filled(:string)
          required(:password).filled(:string)
        end

        def handle(request, response)
          halt 422, {errors: request.params.errors}.to_json unless request.params.valid?

          user_repo = Libus::Repositories::Users.new(Hanami.app["persistence.rom"])
          user = user_repo.admin_by_email?(request.params[:email])

          if user && user.password_hash == BCrypt::Engine.hash_secret(request.params[:password], user.password_salt)
            request.session[:user_id] = user.id
            request.env['warden'].authenticate!

            response.redirect "/admin"
          else
            halt 401, "Unauthorized"
          end
        end
      end
    end
  end
end
