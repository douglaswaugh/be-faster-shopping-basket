# noinspection RubyResolve,RubyResolve
require_relative 'test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

class ClientTest < Minitest::Test

  def test_sum
    assert_equal 3, Sum.new.sum(1, 2), 'App should add two numbers'
  end

  def test_sum_one_number_is_zero
    assert_equal 1, Sum.new.sum(0,1)
  end

  def test_5_plus_6_equals_11
    assert_equal 11, Sum.new.sum(5,6)
  end

end
