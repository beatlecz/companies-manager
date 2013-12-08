require 'rack/test'

# Setup Bundler & Rack in test env
Bundler.setup :default, :test
ENV['RACK_ENV'] = 'test'


OUTER_APP = Rack::Builder.parse_file('config.ru').first
module RSpecMixin
  include Rack::Test::Methods

  def app
    OUTER_APP
  end
end

# For RSpec 2.x
RSpec.configure do |c|
  c.include RSpecMixin
  c.treat_symbols_as_metadata_keys_with_true_values = true
end