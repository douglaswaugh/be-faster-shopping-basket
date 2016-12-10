# noinspection RubyResolve,RubyResolve
require_relative 'test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

class ClientTest < Minitest::Test
    def test_hello_returns_string_passed
        assert_equal "Hello, Douglas!", Hello.new.hello("Douglas")
    end
end