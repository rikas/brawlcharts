# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'brawlhalla/version'

Gem::Specification.new do |spec|
  spec.name          = 'brawlhalla'
  spec.version       = Brawlhalla::VERSION
  spec.authors       = ['Ricardo Otero']
  spec.email         = ['oterosantos@gmail.com']

  spec.summary       = 'Brawlhalla Stats'
  spec.description   = 'Sinatra app to track Brawlhalla players ranking.'
  spec.homepage      = 'http://brawlhalla-stats.com'
  spec.license       = 'MIT'

  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.files         = Dir['lib/*', 'bin/*', 'config/*', 'README.md']
  spec.test_files    = Dir['spec/*']

  spec.add_dependency 'addressable'
  spec.add_dependency 'faraday'
  spec.add_dependency 'nokogiri'
  spec.add_dependency 'pry-byebug'
  spec.add_dependency 'rack'
  spec.add_dependency 'rainbow'
  spec.add_dependency 'sequel'
  spec.add_dependency 'sinatra'
  spec.add_dependency 'sqlite3'
end
