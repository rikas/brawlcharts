# frozen_string_literal: true

require 'sequel/model'

module Brawlcharts
  class Player < Sequel::Model
    one_to_many :rankings

    def win_percentage
      ((wins.to_f / games.to_f) * 100).round
    end
  end
end
