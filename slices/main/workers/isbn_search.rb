# frozen_string_literal: true

require 'net/http'

module Main
  module Workers
    class IsbnSearch
      include Sidekiq::Job
      include Deps[
                "services.get_google_isbn",
                "redis",
                "persistence.rom",
                parser: "parsers.google.isbn"]

      def perform(isbn)
        redis.hset("isbn_search", { isbn => 1 })

        output = parser.parse(
          json: get_google_isbn.call(isbn:)
        )

        redis.hset("isbn_search", { isbn => 2 })

        book = rom.relations[:books].transaction do
          author = rom.relations[:authors].changeset(:create, { name: output[:authors].join(', ') }).commit
          new_book = rom.relations[:books].changeset(:create,
                                                     { title: output[:title],
                                                       description: output[:description],
                                                       image_url: output[:image_url],
                                                       published_date: Date.new(output[:published_date].to_i),
                                                       category: output[:category],
                                                       language: output[:language],
                                                       isbn_10: output[:isbn_numbers].first['identifier'],
                                                       isbn_13: output[:isbn_numbers].last['identifier'],
                                                       author_id: author[:id]
                                                     }
          ).commit
          redis.hset("isbn_search", { isbn => 3 })
        end
      end
    end
  end
end
