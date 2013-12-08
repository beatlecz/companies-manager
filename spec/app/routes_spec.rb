require 'spec_helper'

describe App do
  include Rack::Test::Methods
  include AppSpecHelper

  let(:last_data) { Oj.load last_response.body }

  context 'GET /companies' do
    before :all do
      3.times do |i|
        create_company "t#{i}"
      end
    end

    after :all do
      Company.dataset.delete
    end

    it 'should have' do
      get '/companies'
      ap last_data
      expect(last_response.status).to eql 200
    end

  end

end