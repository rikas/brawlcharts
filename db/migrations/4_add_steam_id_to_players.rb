# frozen_string_literal: true

Sequel.migration do
  up do
    add_column :players, :steam_id, String
  end

  down do
    drop_column :players, :steam_id
  end
end
