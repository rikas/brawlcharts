# frozen_string_literal: true

require 'brawlhalla/db'

Brawlhalla::DB.connect!

require 'brawlhalla'

namespace :players do
  desc 'Updates the ranking of all players in the database'
  task :update do
  end
end
