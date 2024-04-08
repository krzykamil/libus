# frozen_string_literal: true

Test::Factory.define(:user, relation: :users)  do |f|
  f.name { fake(:book, :user) }
  f.password_hash { fake(:lorem, :sentence) }
  f.password_salt { fake(:lorem, :sentence) }
end
