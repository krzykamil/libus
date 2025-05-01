# frozen_string_literal: true

module Admin
  module Views
    module Models
      class Edit < Admin::View
        expose :model_name do |model:|
          model
        end

        # expose :model do |model:, id:|
        #   repo = Libus::App["repositories.#{model}"]
        #   repo.by_id(id)
        # end

        expose :attributes do |model:, id:|
          repo = Libus::App["repositories.#{model}"]
          model_object = repo.by_id(id)
          model_object.attributes
        end

        expose :model_id do |id:|
          id
        end
      end
    end
  end
end
