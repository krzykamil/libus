# frozen_string_literal: true

module Admin
  class Routes < Hanami::Routes
    root to: 'home.show'
    get '/login', to: 'login.new', as: :login
    post "/sessions", to: "sessions.create"
    delete "/logout", to: "sessions.destroy"
    get "/models/:name", to: "models.index"
  end
end
