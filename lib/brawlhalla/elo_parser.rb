# frozen_string_literal: true

require 'nokogiri'
require 'brawlhalla/api'

module Brawlhalla
  class EloParser
    def self.parse(name)
      html_table = API.new(name).html_table
      document = Nokogiri::HTML(html_table)

      document.css('.odd .pcenter')[3]&.text&.to_i || -1
    end
  end
end
