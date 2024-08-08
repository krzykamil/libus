# frozen_string_literal: true

module Main
  module Views
    class Scope < Hanami::View::Scope
      def basic_user_logged?
        Libus::Services::Users::CheckLoggedIn.new(user: request.env['warden'].user, user_type: :basic_user).call.success?
      end
    end
  end
end
