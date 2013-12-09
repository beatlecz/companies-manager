class AttachmentUrlRepresenter
  def self.represent(attachment, opts={})
    File.join('/companies', attachment.owner.company_id.to_s, 'owners', attachment.owner_id.to_s, 'attachment')
  end
end