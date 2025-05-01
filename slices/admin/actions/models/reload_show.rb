# frozen_string_literal: true

module Admin
  module Actions
    module Models
      class ReloadShow < Admin::Action
        def handle(request, response)
          response.render(view, model: request.params[:name], id: request.params[:id])
        end
      end
    end
  end
end
