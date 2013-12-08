require 'sinatra/base'
require 'oj'
require 'sequel'
require 'lib/representation'
require 'lib/representation_dataset'

# General objects extensions
require 'extensions/string'

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
    require 'ap'
  end

  configure :test do
    DB = Sequel.connect 'postgres://localhost/companies_manager_test',
                        :encoding => 'utf-8',
                        :logger => Logger.new($stdout),
                        :max_connections => 30
    require 'ap'
  end

  configure :production do
    DB = Sequel.connect ENV['DATABASE_URL'],
                        :encoding => 'utf-8',
                        :logger => Logger.new($stdout),
                        :max_connections => 30
  end

  # Load models
  require 'models/company'
  require 'models/owner'
  require 'models/director'
  require 'models/data_version'

  # Load representers
  require 'representers/company_index_representer'
  require 'representers/company_detail_representer'

  # Load helpers
  require 'helpers/json_respond'
  require 'helpers/http_helper'
  require 'helpers/api_helper'

  # Include helpers
  helpers JSONRespond
  helpers HttpHelper
  helpers ApiHelper

end