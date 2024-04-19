# frozen_string_literal: true

module Main
  module Repositories
    class Books < Main::Repo[:books]
      commands :create

      def listing
        books.combine(:authors).to_a
      end

      def by_isbn(type:, identifier:)
        if type == 10
          books.where(isbn_10: identifier).first
        else
          books.where(isbn_13: identifier).first
        end
      end

      def by_id(id)
        books.by_pk(id).one!
      end
    end
  end
end
