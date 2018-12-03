# frozen_string_literal: true

require 'sinatra'

module Brawlcharts
  class ApplicationController < Sinatra::Application
    get '/' do
      redirect '/players'
    end
  end
end
