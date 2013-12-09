class OwnerDetailRepresenter
  def self.represent(owner, opts={})
    {
      :id           => owner.id,
      :name         => owner.name,
      :is_director  => owner.is_director,
      :attachment_url => owner.attachments.first.as(:url),
      :company_id   => owner.company_id,
      :created_at   => owner.created_at.to_i
    }
  end
end