# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :books do
      add_foreign_key :author_id, :authors, null: false
      add_index :author_id
    end
  end
end
