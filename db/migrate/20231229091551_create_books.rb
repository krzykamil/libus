# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :books do
      primary_key :id

      column :title, String, null: false
      column :published_date, Date, null: false
      column :description, :text, null: true
      column :image_data, :jsonb, null: true
      column :category, String, null: true
      column :language, String, null: true
      column :isbn_10, String, null: true
      column :isbn_13, String, null: true
    end
  end
end

