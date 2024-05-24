# frozen_string_literal: true

module Main
  module Actions
    module Sessions
      class Destroy < Main::Action
        def handle(request, response)
          request.env['warden'].logout
          response.redirect_to("/admin")
        end
      end
    end
  end
end
