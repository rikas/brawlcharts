# frozen_string_literal: true

require 'sequel'
require 'brawlhalla'
require 'brawlhalla/db'

Sequel.extension :migration

namespace :db do
  desc 'Run migrations'
  task :migrate do
    connection = Brawlhalla::DB.connect!
    Sequel::Migrator.run(connection, File.join(Brawlhalla.db_dir, 'migrations'))
  end

  task :create do
    Sequel.connect(adapter: :postgres, database: :postgres) do |db|
      db.execute 'CREATE DATABASE brawlcharts'
    end
  end
end
