# frozen_string_literal: true

module Admin
  module Views
    module Models
      class Show < Admin::View
        expose :model do |model:|
          model
        end
        expose :attributes do |model:, id:|
          repo = Libus::App["repositories.#{model}"]
          model_object = repo.by_id(id)
          model_object.attributes
        end

        expose :model_name do |model:, id:|
          repo = Libus::App["repositories.#{model}"]
          repo.by_id(id).name
        end

        expose :model_id do |model:, id:|
          id
        end
      end
    end
  end
end
