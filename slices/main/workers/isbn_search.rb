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
        redis.hset("isbn_search", { "user_1_progress" => 1 })
        output = parser.parse(
          json: get_google_isbn.call(isbn:)
        )
        redis.hset("isbn_search", { "user_1_progress" => 2 })
        # Update step 2 of process
        sleep 4
        redis.hset("isbn_search", { "user_1_progress" => 3 })

        # Then send output to a persister
        # Update step 3 of process
      end
    end
  end
end
