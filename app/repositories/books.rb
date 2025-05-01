# frozen_string_literal: true

module Libus
  module Repositories
    class Books < Libus::Repository[:books]
      
      struct_namespace Libus::Entities
      commands :create, update: :by_pk, delete: :by_pk

      # def by_name
      #   authors.order(:name).
      # end/
      def all
        authors.order(:name).to_a
      end

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
        books.by_pk(id).first
      end

      def image_attach(id, image)
        book = books.by_pk(id).first
        attacher = book.image_attacher
        attacher.form_assign({"image" => image})
        attacher.finalize
        self.update(book.id, attacher.column_values)
      end
    end
  end
end
