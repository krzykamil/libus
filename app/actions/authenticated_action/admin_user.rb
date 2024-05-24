# frozen_string_literal: true

module Libus
  module Actions
    module AuthenticatedAction
      class AdminUser < Main::Action
        before :authenticate_user

        private

        def authenticate_user(request, response)
          admin_user_logged = Libus::Services::Users::CheckLoggedIn.new(user: request.env['warden'].user,
                                                                        user_type: :admin).call

          response.redirect_to("/admin/login") if request.path != "/admin/login" && !admin_user_logged
        end
      end
    end
  end
end
