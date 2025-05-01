# frozen_string_literal: true
require "pry"

module Admin
  module Actions
    module Models
      class Update < Admin::Action
        self.template = :reload_show
        params do
          required(:id).filled(:integer)
          required(:first_name).filled(:string)
          required(:last_name).filled(:string)
        end

        def handle(request, response)

          response.render(view, model: request.params[:name], id: request.params[:id])
        end
      end
    end
  end
end
