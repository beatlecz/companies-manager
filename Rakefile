require 'rubygems'
require 'bundler/setup'

unless ENV['RACK_ENV'] == 'production'
  require 'rspec/core'
  require 'rspec/core/rake_task'

  task :default => :spec

  desc 'Run all specs in spec directory (excluding plugin specs)'
  RSpec::Core::RakeTask.new(:spec)

end

