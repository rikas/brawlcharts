# frozen_string_literal: true

require 'sequel'
require 'logger'

module Brawlcharts
  class DB
    attr_accessor :connection

    def self.connect!
      new.connect!
    end

    def connect!
      @connection ||= make_connection
    end

    def root
      File.expand_path('../../', File.dirname(__FILE__))
    end

    private

    def make_connection
      return Sequel.connect(adapter: :postgres, database: 'brawlcharts') if development?

      Sequel.connect(ENV['DATABASE_URL'])
    end

    def development?
      Brawlcharts.env == :development
    end
  end

  def self.env
    env = ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'development'
    env.to_sym
  end
end
