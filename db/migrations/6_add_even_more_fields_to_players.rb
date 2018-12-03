# frozen_string_literal: true

Sequel.migration do
  up do
    add_column :players, :rating, Integer
    add_column :players, :peak_rating, Integer
  end

  down do
    drop_column :players, :rating
    drop_column :players, :peak_rating
  end
end
