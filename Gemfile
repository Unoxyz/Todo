source 'https://rubygems.org'

gem 'activerecord', require: 'active_record'
gem 'sqlite3'
gem 'sinatra', require: false
gem 'thin', require: false

group :test do
  gem 'minitest-reporters', require: 'minitest/reporters'
  gem 'rack-test', require: false
end

group :development, :test do
  gem 'shotgun', require: false
  gem 'tux', require: false
end
