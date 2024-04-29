# frozen_string_literal: true

module Main
  module Actions
    module Books
      class Update < Main::Action
        include Deps['persistence.rom', books_repo: 'repositories.books']
        params do
          required(:id).filled(:integer)
          required(:book).schema do
            optional(:image).value(:hash)
          end
        end

        def handle(request, response)
          halt 422, {errors: request.params.errors}.to_json unless request.params.valid?

          books_repo.image_attach(request.params[:id], request.params[:book][:image][:tempfile])

          response.redirect_to "/books"
        end
      end
    end
  end
end
