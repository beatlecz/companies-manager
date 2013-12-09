class Owner < Sequel::Model
  include Representation::Dataset
  extend UpdatableColumns

  # Plugins
  plugin :timestamps,  :create => :created_at,
                       :update => :updated_at,
                       :update_on_create => true

  # Associations
  many_to_one :company

  def before_create
    super
    self.uuid = SecureRandom.uuid
  end

end