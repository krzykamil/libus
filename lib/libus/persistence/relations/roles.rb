# frozen_string_literal: true

module Libus
  module Persistence
    module Relations
      class Roles < ROM::Relation[:sql]
        schema(:roles, infer: true) do

        end
      end
    end
  end
end
