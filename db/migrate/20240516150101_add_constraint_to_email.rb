# frozen_string_literal: true

ROM::SQL.migration do
  up do
    alter_table :users do
      add_unique_constraint(:email)
    end
  end

  down do
    alter_table :users do
      drop_constraint(:users_email_key)
    end
  end
end
