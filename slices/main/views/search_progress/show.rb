# frozen_string_literal: true

module Main
  module Views
    module SearchProgress
      class Show < Main::View
        config.layout = nil
        include Deps["redis"]
        expose :search_progress, decorate: false do |isbn:|
          search_progress(isbn: isbn)
        end

        private

        def search_progress(isbn:)
          progress = redis.hget("isbn_search", isbn[:identifier])
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
