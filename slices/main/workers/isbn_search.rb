# frozen_string_literal: true

require 'net/http'

module Main
  module Workers
    class IsbnSearch
      include Sidekiq::Job
      include Deps[
                "services.get_google_isbn",
                "redis",
                parser: "parsers.google.isbn"]

      def perform(isbn)
        # Update step 1 of process
        redis.hsetnx("isbn_search_user_1", "progress", 1)
        output = parser.parse(
          json: get_google_isbn.call(isbn:)
        )
        redis.hincrby("isbn_search_user_1", "progress", 1)
        # Update step 2 of process
        # Then send output to a persister
        # Update step 3 of process
      end
    end
  end
end
