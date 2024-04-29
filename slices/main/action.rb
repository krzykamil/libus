# auto_register: false
# frozen_string_literal: true

module Main
  class Action < Libus::Action

    def warden
      request.env['warden']
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
