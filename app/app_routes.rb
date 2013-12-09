$: << 'lib'

require 'sinatra/base'

class App < Sinatra::Base

  # Init point for JS client app
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
    ap request.env
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
    json OK, company.owners_dataset.eager(:attachments).as(:detail)
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


  #############
  # Attachments
  #############

  post '/companies/:company_id/owners/:owner_id/attachment' do
    file = owner.add_attachment name: params['file'][:filename],
                                size: params['file'][:tempfile].size,
                                content_type: params['file'][:type],
                                data: params['file'][:tempfile].read

    json OK, file.as(:url)
  end

  # Download file
  get '/companies/:company_id/owners/:owner_id/attachment' do
    file = owner.attachments_dataset.first
    attachment "#{owner.name} - passport - #{file.name}"
    file.data
  end

end