# frozen_string_literal: true
module Libus
  class Repository < ROM::Repository::Root
    include Deps[container: "persistence.rom"]
  end
end
