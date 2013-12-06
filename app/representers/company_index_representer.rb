class CompanyIndexRepresenter
  def self.represent(company, opts={})
    {
      :id   => company.id,
      :name => company.name
    }
  end
end