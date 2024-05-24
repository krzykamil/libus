# frozen_string_literal: true

module Libus
  module Persistence
    module Relations
      class Users < ROM::Relation[:sql]
        schema(:users, infer: true) do
          associations do
            belongs_to :role
          end
        end
      end
    end
  end
end
