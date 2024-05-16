# frozen_string_literal: true

module Libus
  module Repositories
    class Roles < Libus::Repository[:roles]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        roles.order(:name).to_a
      end

      def by_name(name)
        roles.where(name: name).first
      end
    end
  end
end
