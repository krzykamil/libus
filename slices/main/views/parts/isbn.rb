# frozen_string_literal: true

module Main
  module Views
    module Parts
      class Isbn < Libus::Part

        def type
          size
        end

        def identifier
          value
        end
      end
    end
  end
end
