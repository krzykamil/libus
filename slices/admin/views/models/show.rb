# frozen_string_literal: true
require "pry"

module Admin
  module Views
    module Models
      class Show < Admin::View
        expose :attributes do |model:, id:|
          repo = Libus::App["repositories.#{model}"]
          model_object = repo.by_id(id)
          model_object.attributes
        end

        expose :model_name do |model:, id:|
          repo = Libus::App["repositories.#{model}"]
          repo.by_id(id).name
        end
      end
    end
  end
end
