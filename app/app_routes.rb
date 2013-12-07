$: << 'lib'

require 'sinatra/base'

class App < Sinatra::Base

  get '/' do
    erb :app
  end

  get '/companies' do
    json OK, Company.as(:index)
  end

  #post '/companies' do
  #
  #end

end