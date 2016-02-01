$LOAD_PATH.unshift File.expand_path("./../lib", __FILE__)
require "rake/testtask"

Rake::TestTask.new do |t|
  t.pattern = "test/**/*_test.rb"
end

task :default => :test

namespace :db do
  desc "migrate your database"
  task :migrate do
    require 'bundler'
    Bundler.require
    require './config/environment'
    ActiveRecord::Migrator.migrate('db/migrate')
  end
end

desc "start server"
task :server do
  sh 'shotgun config.ru'
end

desc "open console"
task :console do
  sh 'bundle exec tux'
end

desc "open database"
task :db do
  sh 'sqlite3 db/todo_test.sqlite3'
end
