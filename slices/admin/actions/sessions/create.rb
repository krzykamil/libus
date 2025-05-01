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
          user = user_repo.admin_user_by_email(request.params[:email])

          if user && user.password_hash == BCrypt::Engine.hash_secret(request.params[:password], user.password_salt)

            request.session[:user_id] = user.id
            request.env['warden'].authenticate!

            response.redirect "/admin"
          else
            response.flash.next[:alert] = "Email or password are not correct"
            response.redirect_to("/admin/login")
          end
        end
      end
    end
  end
end
