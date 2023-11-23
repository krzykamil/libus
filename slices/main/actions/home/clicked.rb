# frozen_string_literal: true

module Main
  module Actions
    module Home
      class Clicked < Main::Action
        def handle(*, response)
          response.render(view)
        end
      end
    end
  end
end
