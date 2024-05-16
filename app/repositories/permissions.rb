# frozen_string_literal: true

module Libus
  module Repositories
    class Permissions < Libus::Repository[:permissions]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        permissions.order(:name).to_a
      end
    end
  end
end
