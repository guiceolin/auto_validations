require 'rubygems'
require 'bundler/setup'
require 'test/unit'
require 'active_record'

require File.dirname(__FILE__) + '/../lib/auto_validations'

config = YAML.load_file File.join(File.dirname(__FILE__), 'support', 'database.yml')
ActiveRecord::Base.establish_connection config[ENV['DB'] || 'sqlite3']

Dir["#{File.dirname(__FILE__)}/support/*.rb"].each { |f| require f }
