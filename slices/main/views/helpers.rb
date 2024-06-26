# auto_register: false
# frozen_string_literal: true

module Main
  module Views
    module Helpers
      def flash_message
        notification_scope = scope(Main::Views::Scopes::Notification, notification: _context.flash)
        return if notification_scope.hidden?

        notification_scope.render('layouts/flashes')
      end
    end
  end
end
