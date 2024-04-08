# frozen_string_literal: true

module Libus
  module Actions
    class AuthFailureActionIndex < Main::Action
      def handle(*, response)
        response.body = "STRANGER DANGER"
        response.status = 401
      end
    end
  end
end

