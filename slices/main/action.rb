# auto_register: false
# frozen_string_literal: true

module Main
  class Action < Libus::Action

    def basic_user_logged?
      Libus::Services::Users::CheckLoggedIn.new(user: request.env['warden'].user, user_type: :basic_user).call.success?
    end

    def current_user
      return nil unless request.env['warden']

      request.env['warden'].user
    end

    private

    def view_options(request, response)
      options = {}
      options[:layout] = nil if request.get_header("HTTP_HX_REQUEST") == "true"

      {**super, **options}
    end
  end
end
