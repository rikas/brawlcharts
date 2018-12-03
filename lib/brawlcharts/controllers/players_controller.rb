# frozen_string_literal: true

require 'sinatra'
require 'brawlcharts/models'

module Brawlcharts
  class PlayersController < Sinatra::Application
    set :public_folder, -> { Brawlcharts.assets_dir }
    set :views, -> { Brawlcharts.views_dir }
    enable :logging
    enable :static
    # disable :dump_errors
    # disable :show_exceptions

    get '/' do
      @players = Player.all
      @title = 'Players'

      erb :'players/index', layout: :application
    end

    get '/:name' do
      @player = Player.find(name: params[:name])
      @rankings = Ranking.where(player_id: @player.id).order(:date).all
      @title = "Player #{@player.name}"

      erb :'players/show', layout: :application
    end
  end
end
