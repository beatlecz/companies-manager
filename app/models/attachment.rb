class Attachment < Sequel::Model
  include Representation::Dataset

  # Plugins
  plugin :timestamps, :create => :created_at

  # Associations
  many_to_one :owner

end