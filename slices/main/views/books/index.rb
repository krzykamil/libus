# frozen_string_literal: true

module Main
  module Views
    module Books
      class Index < Main::View
        include Deps['repositories.books']

        expose :books do
          books.listing
        end

      end
    end
  end
end
