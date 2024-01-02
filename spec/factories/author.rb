# frozen_string_literal: true

Test::Factory.define(:author, relation: :authors)  do |f|
  f.name { fake(:book, :author) }
end
