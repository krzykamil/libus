# frozen_string_literal: true

module Admin
  module Views
    module Models
      class Edit < Admin::View
        expose :model do |model:|
          model
        end

        expose :model_id do |id:|
          id
        end
      end
    end
  end
end
