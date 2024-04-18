# frozen_string_literal: true

module Main
  module Actions
    module SearchResult
      class Show < Main::Action
        include Deps["repositories.books"]

        params do
          optional(:isbn).hash do
            optional(:type).value(:integer)
            optional(:identifier).value(:string)
          end
        end

        def handle(request, response)
          if request.params.dig(:isbn, :type) && request.params.dig(:isbn, :identifier)
            book_found = books.by_isbn(
              type: request.params[:isbn][:type].to_i,
              identifier: request.params[:isbn][:identifier]
            )
          end
          response.render(view, book_found: book_found)
        end
      end
    end
  end
end
