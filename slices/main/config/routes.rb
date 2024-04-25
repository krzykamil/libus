# frozen_string_literal: true

module Main
  class Routes < Hanami::Routes
    root to: 'home.show'

    get '/read_more', to: 'home.read_more'
    # New user registration
    get '/register', to: 'register.new', as: :register
    post "/users", to: "users.create"

    # Session management
    get '/login', to: 'login.new', as: :login
    post "/sessions", to: "sessions.create"
    delete "/logout", to: "sessions.destroy"

    get '/books', to: 'books.index'
    get '/books/:id/edit', to: 'books.edit'
    patch '/books/:id', to: 'books.update'

    scope 'search' do
      get '/isbn', to: 'isbn_search.show'
      get '/progress', to: 'search_progress.show'
      get '/result', to: 'search_result.show'
    end
  end
end
