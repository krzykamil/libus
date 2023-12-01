# frozen_string_literal: true

module Main
  class Routes < Hanami::Routes
    root to: 'home.show'

    get '/read_more', to: 'home.read_more'
    get '/register', to: 'register.new'
    get '/login', to: 'login.new'
  end
end
