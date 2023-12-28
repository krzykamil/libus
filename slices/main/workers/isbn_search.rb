# frozen_string_literal: true

require 'net/http'

module Main
  module Workers
    class IsbnSearch
      include Sidekiq::Job
      include Deps[parser: "parsers.google.isbn"]

      def perform(isbn)
        # Update step 1 of process
        uri = URI("https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}")
        response = Net::HTTP.get_response(uri)
        output = parser.parse(response.body)
        # Update step 2 of process
        # Then send output to a persister
        # Update step 3 of process
      end
    end
  end
end
