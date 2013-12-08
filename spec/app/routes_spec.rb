require 'spec_helper'

describe App do
  include Rack::Test::Methods

  context 'GET /companies' do

    it 'should have' do
      get '/companies'
      expect(last_response.status).to eql 200
    end

  end

end