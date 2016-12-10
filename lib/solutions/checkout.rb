# noinspection RubyUnusedLocalVariable
class Checkout

  def initialize
    @prices = {
      :A => 50,
      :B => 30,
      :C => 20,
      :D => 15 
    }

    @special_offer_prices = {
      :A => 130,
      :B => 45
    }
  end

  def checkout(skus)
    return 0 if skus == "";

    total = 0

    special_offers = ""
    skus.scan(/AAA/) do |special_offer_A|
      special_offers += "A"
    end
    skus.scan(/BB/) do |special_offer_B|
      special_offers += "B"
    end

    skus.gsub! 'AAA', ''
    skus.gsub! 'BB', '' 

    skus.each_char do |product|
      total += @prices[product.to_sym]
    end

    special_offers.each_char do |special_offer|
      total += @special_offer_prices[special_offer.to_sym]
    end

    return total
  end

end
