# frozen_string_literal: true

require 'pry'

module Main
  module Actions
    module Sessions
      class Destroy < Main::Action
        def handle(request, response)
          request.env['warden'].logout
          response.redirect_to("/")
        end
      end
    end
  end
end
