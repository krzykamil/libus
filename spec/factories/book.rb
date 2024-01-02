# frozen_string_literal: true

Test::Factory.define(:book, relation: :books)  do |f|
  f.title { fake(:book, :title) }
  f.isbn_13 { "9783161484100" }
  f.sequence(:isbn_13) { |n| "97831614841#{n+1}#{n}" }
  f.published_date { Faker::Date.backward(days: rand(1..100)) }
  f.association(:author)
end
