# frozen_string_literal: true

module Main
  module Views
    module Parts
      class Book < Libus::Part

        def title
          value.title.upcase
        end

        def avatar(size)
          tailwind_size = case size
          when :sm
            "w-32"
          when :md
            "w-20"
          when :lg
            "w-16"
          end
          render("books/avatar", size: tailwind_size)
        end

        decorate :author
      end
    end
  end
end
