# auto-generated migration

# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :roles do
      primary_key :id
      column :name, String, null: false
    end
  end
end

