# frozen_string_literal: true

module Libus
  module Repositories
    class Authors < Libus::Repository[:authors]
      commands :create, update: :by_pk

      def all
        authors.order(:name).to_a
      end

      def by_name(name)
        authors.where(name: name).to_a.first
      end
    end
  end
end
