require 'sinatra/base'
require 'oj'
require 'sequel'
require 'lib/representation'
require 'lib/representation_dataset'
require 'lib/updatable_columns'
require 'lib/data_versioning'

# General objects extensions
require 'extensions/string'
require 'extensions/hash'

class App < Sinatra::Base

  configure do
    set :server,  :puma
    set :root,    './'

    # overwrite Oj default options
    Oj.default_options = {
      :symbol_keys      => true,        # use symbol keys
      :mode             => :compat,     # will check to see if the Object implements a to_hash() or to_json()
      :time_format      => :xmlschema,  # serialize time in ISO8061 format
      :second_precision => 0            # do not include milliseconds
    }
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
                        :logger => nil, #Logger.new($stdout),
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
  require 'models/attachment'
  require 'models/data_version'

  # Load representers
  require 'representers/company_index_representer'
  require 'representers/company_detail_representer'
  require 'representers/owner_detail_representer'
  require 'representers/attachment_url_representer'

  # Load helpers
  require 'helpers/json_respond'
  require 'helpers/http_helper'
  require 'helpers/api_helper'

  # Include helpers
  helpers JSONRespond
  helpers HttpHelper
  helpers ApiHelper

end