# frozen_string_literal: true

module Libus
  module Actions
    module AuthenticatedAction
      class BasicUser < Main::Action
        before :authenticate_user

        private

        def authenticate_user(request, response)
          response.redirect_to("/login") unless request.env['warden'].user
        end
      end
    end
  end
end
