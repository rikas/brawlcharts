# frozen_string_literal: true

require 'nokogiri'
require 'brawlhalla/version'
require 'brawlhalla/models'
require 'brawlhalla/db'
require 'brawlhalla/api'
require 'pry-byebug'
require 'rainbow'

module Brawlhalla
  def self.root
    File.expand_path('../', File.dirname(__FILE__))
  end

  def self.app_dir
    File.expand_path('brawlhalla', File.dirname(__FILE__))
  end

  def self.assets_dir
    File.join(app_dir, 'assets')
  end

  def self.views_dir(subfolder = '')
    File.join(app_dir, 'views', subfolder)
  end

  def self.update_loop(name, interval = 4 * 60)
    loop do
      update_ranking(name)
      sleep(interval)
    end
  end

  def self.update_ranking(name)
    html_table = API.new(name).html_table

    document = Nokogiri::HTML(html_table)
    elo = document.css('.odd .pcenter')[3]&.text

    unless elo
      puts Rainbow("* Could not read the brawlhalla info for `#{name}`").magenta && return
    end

    player = Player.find(name: name)

    ranking = Ranking.where(player_id: player.id).reverse(:created_at).first
    ranking ||= Ranking.new(elo: 0)

    diff = elo.to_i - ranking&.elo

    puts Rainbow("[#{Time.now}] NO ELO CHANGE (#{elo.to_i})").gray.dark if diff.zero?

    return if diff.zero?

    if diff.positive?
      puts Rainbow("[#{Time.now}] ELO GOES UP -> #{elo.to_i} (#{diff})").green
    else
      puts Rainbow("[#{Time.now}] ELO GOES DOWN -> #{elo.to_i} (#{diff})").red
    end

    Ranking.create(player_id: player.id, elo: elo.to_i, created_at: Time.now)
  end
end
