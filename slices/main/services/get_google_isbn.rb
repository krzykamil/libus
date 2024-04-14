# frozen_string_literal: true
require 'net/http'

module Main
  module Services
    class GetGoogleIsbn
      def call(isbn:)
        # TODO:
        # we can validate the isbn to be isbn 10 or 13 maybe
        # also when no book is found, return info about it
        uri = URI("https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}")
        ::Net::HTTP.get_response(uri).body
      end
    end
  end
end
