# frozen_string_literal: true

Test::Factory.define(:user, relation: :users)  do |f|
  f.name { "Hemingway" }
  f.email { "xd@gmail.com" }
  f.password_hash { fake(:lorem, :sentence) }
  f.password_salt { fake(:lorem, :sentence) }
  f.association(:role)
end
