# frozen_string_literal: true

require 'sinatra'

module Brawlhalla
  class PlayersController < Sinatra::Application
    set :public_folder, -> { Brawlhalla.assets_dir }
    set :views, -> { Brawlhalla.views_dir('players') }
    enable :logging
    enable :static
    # disable :dump_errors
    # disable :show_exceptions

    get '/' do
      "ROOT #{self.class.root}"
    end

    get '/:name' do
      @player = Player.find(name: params[:name])
      @rankings = @player.rankings.reverse

      erb :show
    end
  end
end
