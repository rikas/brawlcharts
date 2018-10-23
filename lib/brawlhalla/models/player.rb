# frozen_string_literal: true

require 'sequel/model'

module Brawlhalla
  class Player < Sequel::Model
    one_to_many :rankings
  end
end
