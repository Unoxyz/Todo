ENV['RACK_ENV'] = 'test'
require './config/environment'
$LOAD_PATH.unshift File.expand_path("./../../lib", __FILE__)

require "minitest/autorun"
require "minitest/reporters"
MiniTest::Reporters.use!

module WithRollback
  def temporarily(&block)
    ActiveRecord::Base.connection.transaction do
      block.call
      raise ActiveRecord::Rollback
    end
  end
end
