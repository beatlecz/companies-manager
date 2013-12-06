$: << 'app'

require 'logger'
require 'sinatra/base'
require 'bundler/setup'

require 'app_configuration'
require 'app_routes'

class App < Sinatra::Base
end