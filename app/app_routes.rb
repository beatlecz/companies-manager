$: << 'lib'

require 'sinatra/base'

class App < Sinatra::Base

  get '/' do
    erb :app
  end

  ###########
  # Companies
  ###########

  get '/companies' do
    json OK, Company.as(:index)
  end

  post '/companies' do
    company = Company.create params.slice(*Company.updatable_columns)

    json OK, company.as(:detail)
  end

  get '/companies/:company_id' do
    json OK, company.as(:detail)
  end

  post '/companies/:company_id' do
    company.update params.slice(*Company.updatable_columns)

    json OK, company.as(:detail)
  end

  delete '/companies/:company_id' do
    company.destroy

    no_content
  end

  ########
  # Owners
  ########

  # TODO implement owners endpoints

end