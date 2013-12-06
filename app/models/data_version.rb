class DataVersion < Sequel::Model

  # Plugins
  plugin :timestamps, :create => :created_at,

end