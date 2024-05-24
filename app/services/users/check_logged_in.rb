# frozen_string_literal: true

module Libus
  module Services
    module Users
      class CheckLoggedIn
        include Services::MonadHelper
        attr_accessor :user, :users_repo, :user_type

        def initialize(user:, user_type:)
          @user = user
          @users_repo = Libus::App["repositories.users"]
          @user_type = user_type
        end

        def call
          return Failure("User is not logged in") if user.nil?

          if user_type == :admin
            admin_user = users_repo.admin_by_id?(user.id)
            return Failure("User is not admin") if admin_user.nil?
          elsif user_type == :basic_user
            basic_user = users_repo.basic_user_by_id?(user.id)
            return Failure("User is not basic user") if basic_user.nil?
          end

          Success("Succesfully logged in")
        end
      end
    end
  end
end
