# frozen_string_literal: true

require 'pry'

module Main
  module Views
    module SearchProgress
      class Show < Main::View
        config.layout = nil
        include Deps["redis"]
        expose :search_progress

        private

        def search_progress
          progress = redis.hget("isbn_search", "user_1_progress")
          case progress.to_i
          when 1
            40
          when 2
            80
          when 3
            100
          else
            10
          end
        end
      end
    end
  end
end
