# noinspection RubyUnusedLocalVariable
class Checkout

  def initialize
    @prices = {
      :A => 50,
      :B => 30,
      :C => 20,
      :D => 15 
    }
  end

  def checkout(skus)
    return 0 if skus == "";

    total = 0

    special_offers = ""
    skus.scan(/AAA/) do |special_offer_A|
      special_offers += "A"
    end

    skus.gsub! 'AAA', ''    

    skus.each_char do |product|
      total += @prices[product.to_sym]
    end

    special_offers.each_char do |product|
      total += 130
    end

    return total
  end

end
