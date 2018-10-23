# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :rankings do
      primary_key :id
      foreign_key :player_id, :players, null: false
      Integer :elo, null: false
      DateTime :created_at, null: false
    end
  end
end
