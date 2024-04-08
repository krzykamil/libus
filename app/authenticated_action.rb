# auto_register: false
# frozen_string_literal: true

require "hanami/action"

module Libus
  class AuthenticatedAction < Hanami::Action
    before :authenticate_user!

    private

    def authenticate_user!(request, _)
      halt 401 unless request.env['warden'].authenticate(:password)
    end
  end
end
