# frozen_string_literal: true
require "pry"

module Admin
  module Views
    module Models
      class Index < Admin::View
        expose :model_objects do |model:|
          repo = Libus::App["repositories.#{model}"]

          repo.all
        end
        expose :model_name do |model:|
          model
        end
      end
    end
  end
end
