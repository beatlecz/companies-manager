require 'rubygems'
require 'bundler/setup'
require './app'


run Rack::URLMap.new '/' => App