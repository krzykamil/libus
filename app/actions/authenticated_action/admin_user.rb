# frozen_string_literal: true

module Libus
  module Actions
    module AuthenticatedAction
      class AdminUser < Main::Action
        before :authenticate_user

        private

        def authenticate_user(request, response)
          request.env['warden'].user.
          response.redirect_to("/admin/login") if !request.env['warden'].user && request.path != "/admin/login"
        end
      end
    end
  end
end
