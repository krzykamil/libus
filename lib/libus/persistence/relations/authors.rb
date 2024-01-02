# frozen_string_literal: true

module Libus
  module Persistence
    module Relations
      class Authors < ROM::Relation[:sql]
        schema(:authors, infer: true) do
          associations do
            has_many :books
          end
        end
      end
    end
  end
end
