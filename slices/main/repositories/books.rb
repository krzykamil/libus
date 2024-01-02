# frozen_string_literal: true

module Main
  module Repositories
    class Books < Main::Repo[:books]
      commands :create

      def by_isbn(type:, identifier:)
        if type == 10
          books.where(isbn_10: identifier).one
        else
          books.where(isbn_13: identifier).one
        end
      end
    end
  end
end
