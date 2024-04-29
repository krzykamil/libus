# frozen_string_literal: true

module Libus
  module Persistence
    module Relations
      class Books < ROM::Relation[:sql]
        schema(:books, infer: true) do
          associations do
            belongs_to :author
          end
        end
        auto_struct(true)
      end
    end
  end
end
