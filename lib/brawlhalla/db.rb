require 'sequel'
require 'logger'

module Brawlhalla
  class DB
    attr_accessor :connection

    def self.connect!
      new.connect!
    end

    def connect!
      db_file = File.join(root, 'db', 'development.sqlite3')

      @connection = Sequel.connect("sqlite://#{db_file}", logger: Logger.new(STDOUT))
      # @connection = Sequel.connect("sqlite://#{db_file}")
    end

    def root
      File.expand_path('../../', File.dirname(__FILE__))
    end
  end
end
