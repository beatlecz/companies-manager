module AppSpecHelper
  def post_env
    { 'CONTENT_TYPE' => 'application/json' }
  end

  def company_post_body
    {
      :name => 'Test',
      :city => 'Test City',
      :address => 'Test Street',
      :country => 'Test Country',
      :email => 't@t.com',
      :phone => '123456'
    }
  end

  def create_company(name)
    Company.create name: name,
                   country: 'Test Country',
                   city: 'Test',
                   email: 't@t.com',
                   phone: '123456',
                   address: 'Test Street'
  end
end