class Company < Sequel::Model

  # Plugins
  plugin :timestamps,  :create =>  :created_at,
                       :update => :updated_at,
                       :update_on_create => true

  # Associations
  one_to_many :directors
  one_to_many :owners

end