# frozen_string_literal: true

module Main
  module Views
    module SearchResult
      class Show < Main::View
        config.layout = nil

        expose :book, decorate: false do |book_found:|
          book_found
        end
      end
    end
  end
end
