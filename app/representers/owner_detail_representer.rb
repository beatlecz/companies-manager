class OwnerDetailRepresenter
  def self.represent(owner, opts={})
    {
      :id         => owner.id,
      :name       => owner.name,
      :created_at => owner.created_at.to_i
    }
  end
end