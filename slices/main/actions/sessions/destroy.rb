# frozen_string_literal: true

require 'pry'

module Main
  module Actions
    module Sessions
      class Destroy < Main::Action
        def handle(request, response)
          request.env['warden'].logout
        #   TODO: remove views for this and redirect the user somewhere
        end
      end
    end
  end
end
