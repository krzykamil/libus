# frozen_string_literal: true

module Libus
  module Actions
    module AuthFailure
      class Show < Main::Action
        def handle(request, response)
          response.body = "STRANGER DANGER"
          response.status = 401
        end
      end
    end
  end
end

