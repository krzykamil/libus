# frozen_string_literal: true

require 'pry'

module Main
  module Views
    module SearchProgress
      class Show < Main::View
        config.layout = nil
        # include Dry::Effects.State(:downloads)
        # include Dry::Effects.CurrentTime
        expose :search_progress

        private

        def search_progress
          [10, 40, 80, 100].sample
          # puts "HEEEEEJ!!! #{self.downloads}"
        end
      end
    end
  end
end
