class OwnerDetailRepresenter
  def self.represent(owner, opts={})
    {
      :id             => owner.id,
      :name           => owner.name,
      :is_director    => owner.is_director,
      :attachment_url => "/companies/#{owner.company_id.to_s}/owners/#{owner.id.to_s}/attachment",
      :company_id     => owner.company_id,
      :created_at     => owner.created_at.to_i
    }
  end
end