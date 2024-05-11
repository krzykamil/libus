# frozen_string_literal: true

module Admin
  module Actions
    module Home
      class Show < Admin::Action
        def handle(request, response)
          current_user = request.env['warden'].user
          response.render(view)
        end
      end
    end
  end
end
