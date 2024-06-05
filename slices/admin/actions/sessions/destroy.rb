# frozen_string_literal: true

module Admin
  module Actions
    module Sessions
      class Destroy < Main::Action
        def handle(request, response)
          request.env['warden'].logout
          response.redirect_to("/admin/login")
        end
      end
    end
  end
end
