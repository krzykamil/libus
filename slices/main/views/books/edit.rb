# frozen_string_literal: true

module Main
  module Views
    module Books
      class Edit < Main::View
        include Deps['repositories.books']
        expose :id
        expose :book do |id:|
          books.by_id(id)
        end
      end
    end
  end
end
