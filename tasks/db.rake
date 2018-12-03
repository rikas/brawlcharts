# frozen_string_literal: true

require 'sequel'
require 'brawlcharts'
require 'brawlcharts/db'

Sequel.extension :migration

namespace :db do
  desc 'Run migrations'
  task :migrate do
    connection = Brawlcharts::DB.connect!
    Sequel::Migrator.run(connection, File.join(Brawlcharts.db_dir, 'migrations'))
  end

  task :create do
    Sequel.connect(adapter: :postgres, database: :postgres) do |db|
      db.execute 'CREATE DATABASE brawlcharts'
    end
  end
end
