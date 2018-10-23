# frozen_string_literal: true

require 'addressable'
require 'faraday'

module Brawlhalla
  class API
    BASE_URL = 'http://www.brawlhalla.com/rankings/1v1/eu/'

    def initialize(name)
      @name = name
    end

    def query
      "p=#{@name}"
    end

    def html_table
      uri = Addressable::URI.parse(BASE_URL)
      uri.query = query

      response = Faraday.get(uri)
      response.body
    end
  end
end
