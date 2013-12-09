class CompanyDetailRepresenter
  def self.represent(company, opts={})
    {
      :id       => company.id,
      :name     => company.name,
      :address  => company.address,
      :city     => company.city,
      :country  => company.country,
      :phone    => company.phone,
      :email    => company.email,
      :created_at => company.created_at.to_i,
      :updated_at => company.updated_at.to_i
    }
  end
end