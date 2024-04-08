# auto_register: false
# frozen_string_literal: true

require "hanami/action"

module Libus
  class AuthenticatedAction < Hanami::Action
    before :authenticate_user!

    private

    def authenticate_user!(request, _)
      request.env['warden'].authenticate!
    end
  end
end
