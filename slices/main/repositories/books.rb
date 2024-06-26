# frozen_string_literal: true

module Main
  module Repositories
    class Books < Main::Repo[:books]
      struct_namespace Main::Entities
      commands :create, update: :by_pk, delete: :by_pk

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

      def image_attach(id, image)
        book = books.by_pk(id).one!
        attacher = book.image_attacher
        attacher.form_assign({"image" => image})
        attacher.finalize
        self.update(book.id, attacher.column_values)
      end
    end
  end
end
