require 'bundler'
Bundler.require
require 'yaml'

require 'todo/db_config'
environment = ENV.fetch('RACK_ENV') { 'development' }
config = DBConfig.new(environment).options
ActiveRecord::Base.establish_connection(config)

require 'todo_app'
