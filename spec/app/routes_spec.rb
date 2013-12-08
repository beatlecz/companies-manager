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

      get '/companies'
    end

    after :all do
      Company.dataset.delete
    end

    it 'should has status 200' do
      expect(last_response.status).to eql 200
    end

    it 'should has 3 companies' do
      expect(last_data.count).to eql 3
    end

  end

  context 'POST /companies' do
    before :all do
      post '/companies', Oj.dump(company_post_body), post_env
    end
    after :all do
      Company.dataset.delete
    end

    it 'should has new company' do
      expect(Company.count).to eql 1
    end
    it 'should has correct data' do
      company_values = Company.first.values
      company_values.delete(:id)
      company_values.delete(:created_at)
      company_values.delete(:updated_at)
      company_values.delete(:uuid)

      expect(Set.new(company_values)).to eql Set.new(company_post_body)
    end
  end

  context 'GET /companies/:company_id' do

  end

  context 'POST /companies/:company_id' do

  end

  context 'DELETE /companies/:company_id' do

  end

end