# frozen_string_literal: true

require 'rainbow'
require 'brawlhalla/models'
require 'brawlhalla/elo_parser'

namespace :players do
  desc 'Updates the ranking of a particular player'
  task :update, [:name] do |_, args|
    name = args[:name]

    current_elo = Brawlhalla::EloParser.parse(name)

    error("Could not get elo for player #{name}") unless current_elo.positive?

    player = Brawlhalla::Player.find(name: name)

    ranking = Brawlhalla::Ranking.find(player_id: player.id, date: Date.today)

    if ranking
      ranking.update(elo: current_elo)
    else
      Brawlhalla::Ranking.create(player_id: player.id, elo: current_elo, date: Date.today)
    end
  end

  desc 'Updates the ranking of all players in the database'
  task :update_all do
    players = Brawlhalla::Player.all

    players.each do |player|
      puts "Updating #{player.name}..."
      Rake::Task['players:update'].invoke(player.name)
    end
  end
end

def error(text)
  puts Rainbow(text).red
end
