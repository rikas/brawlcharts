# frozen_string_literal: true

require 'rainbow'
require 'brawlhalla/api'
require 'brawlcharts'

Brawlcharts::DB.connect!

require 'dotenv'
Dotenv.load

require 'brawlhalla/api'

Brawlhalla::API.configure do |config|
  config.api_key = ENV['BRAWLHALLA_API_KEY']
  config.debug = false
end

require 'brawlcharts/models'

namespace :players do
  desc 'Updates the stats and ranking of a particular player'
  task :update, [:name] do |_, args|
    local_player = Brawlcharts::Player.find_by(name: args[:name])

    remote_player = Brawlhalla::API::Player.find(local_player.brawlhalla_id)
    current_elo = remote_player.ranking.rating

    # Update player fields
    local_player.update(
      name: remote_player.name,
      games: remote_player.games,
      wins: remote_player.wins,
      level: remote_player.level
    )

    if current_elo
      puts Rainbow("Remote rating: #{current_elo}").magenta

      local_player.update(
        rating: current_elo,
        peak_rating: remote_player.ranking.peak_rating
      )

      ranking = Brawlcharts::Ranking.find(player_id: local_player.id, date: Date.today)

      if ranking
        ranking.update(elo: current_elo)
      else
        Brawlcharts::Ranking.create(player_id: local_player.id, elo: current_elo, date: Date.today)
      end
    else
      puts Rainbow("Player has no matches this season").red
    end
  end

  desc 'Updates the ranking of all players in the database'
  task :update_all do
    players = Brawlcharts::Player.all

    players.each do |player|
      puts "Updating #{player.name}..."

      Rake::Task['players:update'].invoke(player.name)
      Rake::Task['players:update'].reenable
    end
  end
end

def error(text)
  puts Rainbow(text).red
end
