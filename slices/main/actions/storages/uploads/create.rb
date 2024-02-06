# frozen_string_literal: true

module Main
  module Actions
    module Storages
      module Uploads
        class Create < Main::Action
          format :json

          params do
            required(:storage).hash do
            end
          end

          def handle(request, response)
            puts "JESTEM!!!"
          end
        end
      end
    end
  end
end
