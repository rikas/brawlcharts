# frozen_string_literal: true

require 'sinatra'

module Brawlhalla
  class ApplicationController < Sinatra::Application
    get '/' do
      redirect '/players'
    end
  end
end
