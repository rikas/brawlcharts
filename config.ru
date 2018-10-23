$LOAD_PATH.unshift(File.expand_path('lib/', File.dirname(__FILE__)))

require 'dotenv'
Dotenv.load

require 'brawlhalla/db'

Brawlhalla::DB.connect!

require 'brawlhalla'
require 'brawlhalla/controllers'

map('/players') { run Brawlhalla::PlayersController }
