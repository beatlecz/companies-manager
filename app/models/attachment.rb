class Attachment < Sequel::Model
  include Representation::Dataset

  # Plugins
  plugin :timestamps, :create => :created_at,
                      :update => :updated_at,
                      :update_on_create => true

  # Associations
  many_to_one :owner

end