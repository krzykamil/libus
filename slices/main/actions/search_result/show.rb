# frozen_string_literal: true

module Main
  module Actions
    module SearchResult
      class Show < Main::Action
        include Deps["repositories.books"]

        def handle(request, response)
          response.render(view, book_found: books.by_isbn(type: request.params[:isbn][:type].to_i, identifier: request.params[:isbn][:identifier]))
        end
      end
    end
  end
end
