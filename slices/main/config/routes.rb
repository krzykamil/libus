# frozen_string_literal: true

module Main
  class Routes < Hanami::Routes
    root to: 'home.show'

    get '/read_more', to: 'home.read_more'

    # New user registration
    get '/register', to: 'register.new'
    post "/users", to: "users.create"

    # Session management
    get '/login', to: 'login.new'
    post "/sessions", to: "sessions.create"
    delete "/sessions/:id", to: "sessions.destroy"

    scope 'search' do
      get '/isbn', to: 'isbn_search.show'
      get '/progress', to: 'search_progress.show'
      get '/result', to: 'search_result.show'
    end
  end
end
