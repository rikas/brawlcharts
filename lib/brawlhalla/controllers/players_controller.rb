# frozen_string_literal: true

require 'sinatra'
require 'brawlhalla/models'

module Brawlhalla
  class PlayersController < Sinatra::Application
    set :public_folder, -> { Brawlhalla.assets_dir }
    set :views, -> { Brawlhalla.views_dir }
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
      @rankings = @player.rankings.reverse
      @title = "Player #{@player.name}"

      erb :'players/show', layout: :application
    end
  end
end
