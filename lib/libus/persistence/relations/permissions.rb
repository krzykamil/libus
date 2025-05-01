# frozen_string_literal: true

module Libus
  module Persistence
    module Relations
      class Permissions < ROM::Relation[:sql]
        schema(:permissions, infer: true) do
          associations do
            has_many :roles
          end
        end
      end
    end
  end
end
