# frozen_string_literal: true
require "pry"
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

