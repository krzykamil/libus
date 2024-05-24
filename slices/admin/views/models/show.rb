# frozen_string_literal: true
require "pry"

module Admin
  module Views
    module Authors
      class Index < Admin::View
        authors_repo = Libus::App["repositories.authors"]
        author_list = authors_repo.all

        expose :authors do
          author_list
        end
      end
    end
  end
end
