# auto-generated migration

# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :users do
      add_foreign_key :role_id, :roles, null: false
      add_index :role_id
    end
  end
end

