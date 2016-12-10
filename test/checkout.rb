# noinspection RubyResolve,RubyResolve
require_relative 'test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

class ClientTest < Minitest::Test
    def test_checkout_should_return_0_for_emtpy_SKU
        assert_equal 0, Checkout.new.checkout("")
    end

    def test_checkout_should_return_50_for_A
        assert_equal 50, Checkout.new.checkout("A")
    end
end