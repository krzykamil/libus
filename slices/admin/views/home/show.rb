# frozen_string_literal: true
require "pry"

module Admin
  module Views
    module Home
      class Show < Admin::View

        # binding.pry
        model = [:authors, :books, :users]
        # model = Main::Repo.relation_reader.relations
        expose :models do
          model
        end
      end
    end
  end
end
