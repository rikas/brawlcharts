# frozen_string_literal: true

require 'sequel'
require 'logger'

module Brawlhalla
  class DB
    attr_accessor :connection

    def self.connect!
      new.connect!
    end

    def connect!
      @connection = if Brawlhalla.env == :development
                      Sequel.connect(adapter: :postgres, database: 'brawlcharts')
                    else
                      Sequel.connect(ENV['DATABASE_URL'])
                    end
    end

    def root
      File.expand_path('../../', File.dirname(__FILE__))
    end
  end

  def self.env
    env = ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'development'
    env.to_sym
  end
end
