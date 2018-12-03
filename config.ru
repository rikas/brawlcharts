$LOAD_PATH.unshift(File.expand_path('lib/', File.dirname(__FILE__)))

require 'dotenv'
Dotenv.load

require 'brawlcharts/db'

Brawlcharts::DB.connect!

require 'brawlcharts'
require 'brawlcharts/controllers'

map('/') { run Brawlcharts::ApplicationController }
map('/players') { run Brawlcharts::PlayersController }
