# auto_register: false
# frozen_string_literal: true

module Main
  class Action < Libus::Action

    def warden
      request.env['warden']
    end
  end
end
