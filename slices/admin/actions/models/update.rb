# frozen_string_literal: true
require "pry"

module Admin
  module Actions
    module Models
      class Update < Admin::Action
        params do
          required(:id).filled(:integer)
          required(:first_name).filled(:string)
          required(:last_name).filled(:string)
        end

        def handle(request, response)
          binding.pry
          halt 422, {errors: request.params.errors}.to_json unless request.params.valid?

          response.redirect_to("/admin/models/authors/4")
        end

        # def handle_invalid_csrf_token(*, res)
        #   binding.pry
        #   res.session.clear
        # end
      end
    end
  end
end
