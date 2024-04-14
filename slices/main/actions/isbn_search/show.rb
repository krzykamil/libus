# frozen_string_literal: true

require 'net/http'

module Main
  module Actions
    module IsbnSearch
      class Show < Libus::Actions::AuthenticatedAction
        params do
          required(:isbn).filled(:string)
        end

        def handle(request, response)
          halt 422, {errors: request.params.errors}.to_json unless request.params.valid?
          Main::Workers::IsbnSearch.perform_async(request.params[:isbn])
          response.render(view, isbn: request.params[:isbn])
        end
      end
    end
  end
end
