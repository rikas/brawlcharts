# frozen_string_literal: true

Sequel.migration do
  up do
    add_column :players, :brawlhalla_id, String
  end

  down do
    drop_column :players, :brawlhalla_id
  end
end
