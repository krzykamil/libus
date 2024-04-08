# frozen_string_literal: true


module Main
  module Actions
    module Home
      class Show < Libus::AuthenticatedAction
        def handle(request, response)
          response.render(view)
        end
      end
    end
  end
end
