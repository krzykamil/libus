# frozen_string_literal: true

module Main
  module Actions
    module Register
      class New < Main::Action
        def handle(request, response)
          response.render(view)
        end
      end
    end
  end
end
