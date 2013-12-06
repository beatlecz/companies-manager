require 'rubygems'
require 'bundler/setup'
require './app/rack/json_post_parser'
require './app'

# POST json data parsing
use Rack::JsonPostParser

run Rack::URLMap.new '/' => App