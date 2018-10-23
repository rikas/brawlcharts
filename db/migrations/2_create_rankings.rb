# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :rankings do
      primary_key :id
      foreign_key :player_id, :players, null: false
      Integer :elo, null: false
      Date :date, null: false
      index %i[player_id date], unique: true
    end
  end
end
