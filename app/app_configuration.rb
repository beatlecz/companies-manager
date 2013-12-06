require 'sinatra/base'
require 'oj'
require 'sequel'
require 'lib/representation'
require 'lib/representation_dataset'


class App < Sinatra::Base

  configure do
    set :server,  :puma
    set :root,    './'
  end

  configure :development do
    DB = Sequel.connect 'postgres://localhost/companies_manager_development',
                        :encoding => 'utf-8',
                        :logger => Logger.new($stdout),
                        :max_connections => 30
  end

  configure :production do
    DB = Sequel.connect ENV['DATABASE_URL'],
                        :encoding => 'utf-8',
                        :logger => Logger.new($stdout),
                        :max_connections => 30
  end

  require 'models/company'
  require 'models/owner'
  require 'models/director'
  require 'models/data_version'

end