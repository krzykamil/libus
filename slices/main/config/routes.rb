# frozen_string_literal: true

module Main
  class Routes < Hanami::Routes
    root to: 'home.show'

    post '/clicked', to: 'home.clicked'
  end
end
