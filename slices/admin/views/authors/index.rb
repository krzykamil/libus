# frozen_string_literal: true

module Admin
  module Views
    module Authors
      class Index < Admin::View
        expose :model_objects do
          repo = Libus::App["repositories.authors"]

          repo.all
        end
        # expose :model_name do |model:|
        #   model
        # end
      end
    end
  end
end
