# frozen_string_literal: true

module Main
  module Repositories
    class Authors < Main::Repo[:authors]
      commands :create
    end
  end
end
