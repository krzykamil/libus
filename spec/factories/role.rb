# frozen_string_literal: true

Test::Factory.define(:role, relation: :roles)  do |f|
  f.name { "basic_user" }
end
