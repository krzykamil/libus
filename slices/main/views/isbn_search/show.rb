# frozen_string_literal: true

module Main
  module Views
    module IsbnSearch
      class Show < Main::View
        config.layout = nil

        expose :isbn do |isbn:|
          { type: isbn.size, identifier: isbn }
        end
      end
    end
  end
end
