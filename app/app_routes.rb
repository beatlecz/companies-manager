$: << 'lib'

require 'sinatra/base'

class App < Sinatra::Base

  get '/' do
    erb :app
  end

end