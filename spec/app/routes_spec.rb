require 'spec_helper'

describe App do
  include Rack::Test::Methods
  include AppSpecHelper

  let(:last_data) { Oj.load last_response.body }

  context 'Companies', :companies do

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
        company_values = Company.first.values.except(:id, :created_at, :updated_at, :uuid)

        expect(Set.new(company_values)).to eql Set.new(company_post_body)
      end
    end

    context 'GET /companies/:company_id' do
      before :all do
        c = create_company 'test'
        get "/companies/#{c.id}"
      end
      after :all do
        Company.dataset.delete
      end

      it 'should return detail' do
        expect(last_response.status).to eql 200
        expect(last_data).to eql Company.first.as(:detail)
      end
    end

    context 'POST /companies/:company_id' do
      before :all do
        c = create_company 'test'
        body = {
          :name => 'updated_name'
        }

        post "/companies/#{c.id}", Oj.dump(body), post_env
      end
      after :all do
        Company.dataset.delete
      end

      it 'should update name' do
        expect(last_response.status).to eql 200
        expect(last_data[:name]).to eql 'updated_name'
      end
    end

    context 'DELETE /companies/:company_id' do
      before :all do
        c = create_company 'test'

        delete "/companies/#{c.id}", {}, post_env
      end
      after :all do
        Company.dataset.delete
      end

      it 'should delete' do
        expect(Company.count).to eql 0
      end
    end

  end

  context 'Owners', :owners do

    context 'GET /companies/:company_id/owners' do
      before :all do
        c = create_company 'test'
        c.add_owner name: 'test1'
        c.add_owner name: 'test2'

        get "/companies/#{c.id}/owners"
      end
      after :all do
        Company.dataset.delete
        Owner.dataset.delete
      end

      it 'should have OK status' do
        expect(last_response.status).to eql 200
      end

      it 'should return 2 owners' do
        expect(last_data.count).to eql 2
      end
    end

    context 'POST /companies/:company_id/owners' do

    end

    context 'GET /companies/:company_id/owners/:owner_id' do

    end

    context 'POST /companies/:company_id/owners/:owner_id' do

    end

    context 'DELETE /companies/:company_id/owners/:owner_id' do

    end

  end

end