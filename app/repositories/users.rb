# frozen_string_literal: true

module Libus
  module Repositories
    class Users < Libus::Repository[:users]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        users.order(:name).to_a
      end

      def admin_by_id?(user_id)
        by_role("admin_user").by_pk(user_id).to_a.first
      end

      def basic_user_by_id?(user_id)
        by_role("basic_user").by_pk(user_id).to_a.first
      end

      def admin_by_email?(email)
        by_role("admin_user").where(email: email).to_a.first
      end

      def basic_user_by_email?(email)
        by_role("basic_user").where(email: email).to_a.first
      end

      def query(conditions)
        users.where(conditions)
      end

      def email_taken?(email)
        users.exist?(email: email)
      end

      def by_email(email)
        users.where(email: email).one
      end

      def admin_user_by_email(email)
        binding.pry
        users.combine(:roles).node(:role) {|role|
          role.where(name: 'Project 1, Task 2')
          }.to_a.first
        # users.where(email: email).one
      end

      def basic_user_by_email(email)
        users.where(email: email).one
      end

      def by_id(id)
        users.by_pk(id).one!
      end

      private

      def by_role(role)
        users.join(:roles, id: :role_id).where(roles[:name] => role)
      end
    end
  end
end
