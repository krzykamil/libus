# frozen_string_literal: true

module Libus
  module Actions
    module AuthenticatedAction
      class BasicUser < Main::Action
        before :authenticate_user

        private

        def authenticate_user(request, response)
          basic_user_logged = Libus::Services::Users::CheckLoggedIn.new(user: request.env['warden'].user,
                                                                        user_type: :basic_user).call

          response.redirect_to("/login") unless basic_user_logged.failure?
        end
      end
    end
  end
end
