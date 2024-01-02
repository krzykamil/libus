# frozen_string_literal: true

module Main
  module Views
    module SearchResult
      class Show < Main::View
        config.layout = nil

        expose :book do |book_found:|
          puts book_found
        end
      end
    end
  end
end
