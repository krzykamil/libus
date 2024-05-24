# frozen_string_literal: true

module Admin
  module Actions
    module Models
      class Index < Admin::Action
        def handle(request, response)
          response.render(view, model: request.params[:name])
        end
      end
    end
  end
end
