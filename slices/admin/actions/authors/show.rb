# frozen_string_literal: true

module Admin
  module Actions
    module Authors
      class Show < Admin::Action
        def handle(request, response)

          response.render(view)
        end
      end
    end
  end
end
