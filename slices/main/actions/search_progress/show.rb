# frozen_string_literal: true

require 'pry'

module Main
  module Actions
    module SearchProgress
      class Show < Main::Action
        def handle(request, response)
          response.render(view)
        end
      end
    end
  end
end
