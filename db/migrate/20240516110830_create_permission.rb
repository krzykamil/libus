# auto-generated migration

# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :permissions do
      primary_key :id
      column :name, String, null: false
      foreign_key :role_id, :roles, null: false
      index :role_id
    end
  end
end

