# frozen_string_literal: true

Test::Factory.define(:permission, relation: :permissions)  do |f|
  f.name { fake(:book, :user) }
end
