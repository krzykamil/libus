# frozen_string_literal: true

module Libus
  module Repositories
    class Authors < Libus::Repository[:authors]
      commands :create

      def all
        authors.order(:name).to_a
      end
    end
  end
end
