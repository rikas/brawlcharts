# frozen_string_literal: true

require 'nokogiri'
require 'faraday'
require 'brawlhalla/player'

module Brawlhalla
  class Stats
    BASE_URL = 'http://www.brawlhalla.com/rankings/1v1/eu/'

    def self.fetch(player)
      table = Player.new(player).html_table
    end
  end
end
