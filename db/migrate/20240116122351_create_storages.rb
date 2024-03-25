# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :storages do
      primary_key :id

      column :images, :jsonb
    end
  end
end
