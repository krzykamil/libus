# frozen_string_literal: true

module Libus
  module Repositories
    class Users < Libus::Repository[:users]
      commands :create, update: :by_pk, delete: :by_pk

      def query(conditions)
        users.where(conditions)
      end

      def email_taken?(email)
        users.exist?(email: email)
      end

      def by_email(email)
        users.where(email: email).one
      end

      def by_id(id)
        users.by_pk(id).one!
      end
    end
  end
end
