# frozen_string_literal: true

module Admin
  module Actions
    module Sessions
      class Create < Admin::Action
        include Deps[user_repo: "repositories.users"]

        params do
          required(:email).filled(:string)
          required(:password).filled(:string)
        end

        def handle(request, response)
          halt 422, {errors: request.params.errors}.to_json unless request.params.valid?
          binding.pry
          user = user_repo.admin_user_by_email(request.params[:email])
          binding.pry

          if user && user.password_hash == BCrypt::Engine.hash_secret(request.params[:password], user.password_salt)
            binding.pry

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
