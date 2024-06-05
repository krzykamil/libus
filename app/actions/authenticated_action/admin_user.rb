# frozen_string_literal: true

module Libus
  module Actions
    module AuthenticatedAction
      class AdminUser < Main::Action
        before :authenticate_user

        private

        def authenticate_user(request, response)
          return if request.path == "/admin/login" || request.path == "/admin/sessions"

          admin_user_logged = Libus::Services::Users::CheckLoggedIn.new(user: request.env['warden'].user,
                                                                        user_type: :admin).call
          basic_user_logged = Libus::Services::Users::CheckLoggedIn.new(user: request.env['warden'].user,
                                                                        user_type: :basic_user).call
          if admin_user_logged.failure?
            request.env['warden'].logout if basic_user_logged.success?

            response.flash[:alert] = admin_user_logged.failure
            response.redirect_to("/admin/login") if admin_user_logged.failure?
          end
        end
      end
    end
  end
end
