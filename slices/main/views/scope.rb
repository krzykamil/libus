# frozen_string_literal: true

module Main
  module Views
    class Scope < Hanami::View::Scope
      def warden
        request.env['warden']
      end
    end
  end
end
