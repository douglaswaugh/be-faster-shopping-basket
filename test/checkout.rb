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

    def test_checkout_should_return_30_for_B
        assert_equal 30, Checkout.new.checkout("B")
    end

    def test_checkout_should_return_20_for_C
        assert_equal 20, Checkout.new.checkout("C")
    end

    def test_checkout_should_return_15_for_D
        assert_equal 15, Checkout.new.checkout("D")
    end

    def test_checkout_should_return_40_for_E
        assert_equal 40, Checkout.new.checkout("E")
    end

    def test_checkout_should_handle_multiple_products
        assert_equal 100, Checkout.new.checkout("AA")
    end

    def test_checkout_should_give_discount_for_multiple_A
        assert_equal 130, Checkout.new.checkout("AAA")
    end

    def test_checkout_should_give_discount_for_5_A
        assert_equal 200, Checkout.new.checkout("AAAAA")
    end

    def test_checkout_should_give_discount_for_multiple_B
        assert_equal 45, Checkout.new.checkout("BB")
    end

    def test_checkout_should_give_discount_for_out_of_order_multiple_products
        assert_equal 175, Checkout.new.checkout("ABABA")
    end

    def test_checkout_should_handle_multiple_products_in_random_order
        assert_equal 380, Checkout.new.checkout("AABCCBCBBDBACCB")
    end

    def test_checkout_should_handle_unknown_items
        assert_equal -1, Checkout.new.checkout('x')
    end

    def test_checkout_should_handle_getting_a_free_product_for_multibuy
        assert_equal 80, Checkout.new.checkout('EEB')
    end

    def test_checkout_should_only_give_free_product_discount_if_customer_purchasing_free_product
        assert_equal 80, Checkout.new.checkout('EE')
    end

    def test_checkout_should_give_customer_best_discount
        assert_equal 160, Checkout.new.checkout('BEBEEE')
    end

    def test_checkout_should_order_skus_alphabetically
        assert_equal "AAAABBBBCCCCDDDD", Checkout.new.order_skus_alphabetically("ABCDABCDABCDABCD")
    end

    def test_checkout_should_remove_free_products_for_E_multibuy
        assert_equal "EEEE", Checkout.new.calculate_free_products("EEEEBB")
    end

    def test_checkout_should_calculate_free_products_discount
        assert_equal 60, Checkout.new.calculate_free_products_discount("BB", "BB")
    end
end