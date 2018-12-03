# frozen_string_literal: true

Sequel.migration do
  up do
    add_column :players, :games, Integer
    add_column :players, :wins, Integer
    add_column :players, :level, Integer
  end

  down do
    drop_column :players, :games
    drop_column :players, :wins
    drop_column :players, :level
  end
end
