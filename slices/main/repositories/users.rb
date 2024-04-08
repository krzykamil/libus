# frozen_string_literal: true

module Main
  module Repositories
    class Users < Main::Repo[:users]
      commands :create, update: :by_pk, delete: :by_pk

      def query(conditions)
        users.where(conditions)
      end

      def by_id(id)
        users.by_pk(id).one!
      end
    end
  end
end
