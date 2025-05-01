# frozen_string_literal: true

module Libus
  module Repositories
    class Permissions < Libus::Repository[:permissions]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        permissions.order(:name).to_a
      end

      def by_id(id)
        permissions.by_pk(id).one!
      end
    end
  end
end
