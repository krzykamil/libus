# frozen_string_literal: true

module Admin
  module Actions
    module Permissions
      class Show < Admin::Action
        def handle(request, response)
          response.render(view)
        end
      end
    end
  end
end
