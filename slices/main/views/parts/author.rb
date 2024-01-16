# frozen_string_literal: true

module Main
  module Views
    module Parts
      class Author < Libus::Part

        def name
          value.name.upcase
        end
      end
    end
  end
end
