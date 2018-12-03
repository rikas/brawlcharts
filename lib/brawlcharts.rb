# frozen_string_literal: true

require 'brawlcharts/version'
require 'brawlcharts/db'

module Brawlcharts
  module_function

  def root
    File.expand_path('../', File.dirname(__FILE__))
  end

  def app_dir
    File.expand_path('brawlcharts', File.dirname(__FILE__))
  end

  def assets_dir
    File.join(app_dir, 'assets')
  end

  def db_dir
    File.join(root, 'db')
  end

  def views_dir(subfolder = '')
    File.join(app_dir, 'views', subfolder)
  end
end
