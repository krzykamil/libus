# frozen_string_literal: true

module Main
  module Workers
    class IsbnSearch
      include Sidekiq::Job
      include Deps[
                "services.get_google_isbn",
                "redis",
                "persistence.rom",
                "repositories.books",
                parser: "parsers.google.isbn"]

      def perform(isbn)
        redis.hset("isbn_search", { isbn => 1 })

        output = parser.parse(
          json: get_google_isbn.call(isbn:)
        )
        if output == {} || output.nil?
          redis.hset("isbn_search", { isbn => 0 })
          return
        end
        redis.hset("isbn_search", { isbn => 2 })

        if books.by_isbn(type: 10, identifier: isbn) || books.by_isbn(type: 13, identifier: isbn)
          redis.hset("isbn_search", { isbn => 3 })
        else
          rom.relations[:books].transaction do
            author = rom.relations[:authors].changeset(:create, { name: output[:authors].join(', ') }).commit
            rom.relations[:books].changeset(:create,
                                                       { title: output[:title],
                                                         description: output[:description],
                                                         published_date: Date.new(output[:published_date].to_i),
                                                         category: output[:category],
                                                         language: output[:language],
                                                         isbn_10: output[:isbn_numbers].select{|num| num["type"] == "ISBN_10" }.first['identifier'],
                                                         isbn_13: output[:isbn_numbers].select{|num| num["type"] == "ISBN_13" }.first['identifier'],
                                                         author_id: author[:id]
                                                       }
            ).commit
            redis.hset("isbn_search", { isbn => 3 })
          end
        end
      end
    end
  end
end
