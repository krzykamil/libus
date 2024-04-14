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
  end
end
