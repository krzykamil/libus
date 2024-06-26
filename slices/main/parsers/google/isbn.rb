# frozen_string_literal: true

module Main
  module Parsers
    module Google
      class Isbn < Main::Parser
        def parse(json:)
          json = JSON.parse(json)
          if json['totalItems'].to_i == 1
            item = json['items'].first['volumeInfo']
            output[:title] = item['title']
            output[:authors] = item['authors']
            output[:description] = item['description']
            output[:publisher] = item['publisher']
            output[:published_date] = item['publishedDate']
            output[:category] = item['category']
            output[:language] = item['language']
            output[:isbn_numbers] = item['industryIdentifiers']
          end
          output
        end
      end
    end
  end
end
