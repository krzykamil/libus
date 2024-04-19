# frozen_string_literal: true

module Main
  module Actions
    module Books
      class Edit < Main::Action
        def handle(request, response)
          response.render view, id: request.params[:id]
        end
      end
    end
  end
end
