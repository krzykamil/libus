# frozen_string_literal: true

module Libus
  module Repositories
    class Authors < Libus::Repository[:authors]
      commands :create, update: :by_pk

      def all
        authors.order(:name).to_a
      end
    end
  end
end
