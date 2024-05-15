# frozen_string_literal: true

module Admin
  class Routes < Hanami::Routes
    root to: 'home.show'

    # get "/authors", to: "authors#index"
  end
end
