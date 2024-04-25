# frozen_string_literal: true

require 'pry'

module Main
  module Actions
    module Books
      class Update < Main::Action
        include Deps['persistence.rom', books_repo: 'repositories.books']
        # params do
        #   required(:id).filled(:integer)
        #   required(:book).schema do
        #   #   optional(:title).value(:string)
        #   #   optional(:author_id).value(:string)
        #   #   optional(:published_date).value(:date)
        #   #   optional(:description).value(:string)
        #   #   optional(:image_url).value(:string)
        #     optional(:image).value(:hash)
        #   #   optional(:category).value(:string)
        #   #   optional(:language).value(:string)
        #   #   optional(:isbn_10).value(:string)
        #   #   optional(:isbn_13).value(:string)
        #   end
        # end

        def handle(request, response)
          halt 422, {errors: request.params.errors}.to_json unless request.params.valid?

          book = books_repo.by_id(request.params[:id])
          halt 404 unless book
          attacher = book.image_attacher
          attacher.form_assign({"image" => request.params[:book][:image][:tempfile]})
          attacher.finalize
          books_repo.update(book.id, attacher.column_values)

          response.redirect_to "/books"
        end
      end
    end
  end
end
