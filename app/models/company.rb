class Company < Sequel::Model
  include Representation::Dataset

  # Plugins
  plugin :timestamps,  :create =>  :created_at,
                       :update => :updated_at,
                       :update_on_create => true

  # Associations
  one_to_many :directors
  one_to_many :owners

  def before_create
    super
    self.uuid = SecureRandom.uuid
  end

end