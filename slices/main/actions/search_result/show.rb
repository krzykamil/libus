# frozen_string_literal: true

module Main
  module Actions
    module SearchResult
      class Show < Main::Action
        include Deps["repositories.books"]

        def handle(request, response)
          response.render(view, book: books.by_isbn(type: request.params[:type].to_i, identifier: request.params[:identifier]))
        end
      end
    end
  end
end
