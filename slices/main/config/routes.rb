# frozen_string_literal: true

module Main
  class Routes < Hanami::Routes
    root to: 'home.show'

    get '/read_more', to: 'home.read_more'
  end
end
