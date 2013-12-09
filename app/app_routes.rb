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

  get '/companies/:company_id/owners' do
    json OK, company.owners_dataset.as(:detail)
  end

  post '/companies/:company_id/owners' do
    owner = company.add_owner params.slice(*Owner.updatable_columns)

    json OK, owner.as(:detail)
  end

  get '/companies/:company_id/owners/:owner_id' do
    json OK, owner.as(:detail)
  end

  post '/companies/:company_id/owners/:owner_id' do
    owner.update params.slice(*Owner.updatable_columns)

    json OK, owner.as(:detail)
  end

  delete '/companies/:company_id/owners/:owner_id' do
    owner.destroy

    no_content
  end

end