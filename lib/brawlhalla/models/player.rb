# frozen_string_literal: true

require 'addressable'
require 'faraday'
require 'sequel/model'

module Brawlhalla
  class Player < Sequel::Model
    one_to_many :rankings
  end
end
