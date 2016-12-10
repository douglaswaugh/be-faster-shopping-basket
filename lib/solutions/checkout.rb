# noinspection RubyUnusedLocalVariable
class Checkout

  def initialize
    @prices = {
      :A => 50,
      :B => 30,
      :C => 20,
      :D => 15,
      :E => 40 
    }

    @special_offer_prices = {
      :A => 130,
      :B => 45,
      :C => 200
    }
  end

  def checkout(skus)
    return 0 if skus == "";
    return -1 if skus.match(/\W+/)
    return -1 if skus.match(/[a-z]+/)

    skus = skus.chars.sort.join

    special_offers = ""
    skus.scan(/AAAAA/) do
      special_offers += "C"
    end
    skus.gsub! 'AAAAA', ''

    skus.scan(/AAA/) do
      special_offers += "A"
    end
    skus.gsub! 'AAA', ''
    
    skus.scan(/BB/) do
      special_offers += "B"
    end
    skus.gsub! 'BB', ''

    free_products = ""
    skus.scan(/EE/) do
      free_products += "B"
    end

    total = 0

    skus.each_char do |product|
      total += @prices[product.to_sym]
    end

    special_offers.each_char do |special_offer|
      total += @special_offer_prices[special_offer.to_sym]
    end

    free_products.each_char do |free_product|
      total -= @prices[free_product.to_sym]
    end

    return total
  end

end
