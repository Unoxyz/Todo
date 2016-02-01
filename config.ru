# put lib folder on the load path
$LOAD_PATH.unshift File.expand_path("./../lib", __FILE__)

# Require all default dependencies
require "bundler"
Bundler.require

# Load up the main configuration
require "./config/environment"

# Load up for running the web app
require "sinatra/base"
# require "thin"

# Load up actual web app
require "api"

# don't stay open when request are finished
use ActiveRecord::ConnectionAdapters::ConnectionManagement

# run Sinatra app
run TodoAPI
