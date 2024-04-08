# frozen_string_literal: true


require "pry"
module Main
  module Actions
    module Home
      class Show < Main::Action
        def handle(request, response)
          binding.pry
          response.render(view)
        end
      end
    end
  end
end
