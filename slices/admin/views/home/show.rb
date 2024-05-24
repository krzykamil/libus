# frozen_string_literal: true
require "pry"

module Admin
  module Views
    module Home
      class Show < Admin::View

        persistence = Libus::App["persistence.rom"]
        models = persistence.relations.to_a.map(&:first)
        # binding.pry
        # model = [:authors, :books, :users]
        # model = Main::Repo.relation_reader.relations
        expose :models do
          models
        end
      end
    end
  end
end
