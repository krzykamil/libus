# frozen_string_literal: true

require 'pry'

module Main
  module Actions
    module SearchProgress
      class Show < Main::Action
        include Deps["redis"]
        def handle(request, response)
          response.headers["HX-Trigger"] = "done" if redis.hget("isbn_search", request.params[:isbn][:identifier]).to_i == 3
          response.render(view, isbn: request.params[:isbn])
        end
      end
    end
  end
end
