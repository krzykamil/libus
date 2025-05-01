# frozen_string_literal: true

module Admin
  module Views
    module Scopes
      class Notification < Admin::Views::Scope
        def message
          return '' if hidden?

          notification[:notice] ? notification[:notice] : notification[:alert]
        end

        def notification_class
          return 'hidden' if hidden?

          notification[:notice] ? "alert-info" : "alert-warning"
        end

        def hidden?
          !(notification[:notice] || notification[:alert])
        end
      end
    end
  end
end
