class Owner < Sequel::Model
  include Representation::Dataset
  include DataVersioning
  extend UpdatableColumns

  # Plugins
  plugin :timestamps,  :create => :created_at,
                       :update => :updated_at,
                       :update_on_create => true

  # Associations
  many_to_one :company
  one_to_many :attachments

  def before_create
    super
    self.uuid = SecureRandom.uuid
  end

  def before_update
    super
    backup_version
  end


  def after_destroy
    cleanup_versions
    super
  end

end