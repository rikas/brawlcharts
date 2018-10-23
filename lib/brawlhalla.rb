# frozen_string_literal: true

require 'brawlhalla/version'
require 'brawlhalla/db'

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

  def self.db_dir
    File.join(root, 'db')
  end

  def self.views_dir(subfolder = '')
    File.join(app_dir, 'views', subfolder)
  end
end
