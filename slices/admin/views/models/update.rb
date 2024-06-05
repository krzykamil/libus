# frozen_string_literal: true

module Admin
  module Views
    module Models
      class Update < Admin::View
        expose :model_name do |model:|
          model
        end
      end
    end
  end
end
