# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id
      column :name, String, null: false
      column :email, String, null: false
      column :password_hash, String, null: false
      column :password_salt, String, null: false
    end
  end
end
