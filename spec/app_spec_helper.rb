module AppSpecHelper
  def create_company(name)
    Company.create name: name,
                   country: 'Test Country',
                   city: 'Test',
                   email: 't@t.com',
                   phone: '123456',
                   address: 'Test Street'
  end
end