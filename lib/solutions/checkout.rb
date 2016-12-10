# noinspection RubyUnusedLocalVariable
class Checkout

  def initialize
    @prices = {
      :A => 50,
      :B => 30,
      :C => 20,
      :D => 15,
      :E => 40,
      :F => 10,
      :G => 20,
      :H => 10,
      :I => 35,
      :J => 60,
      :K => 80,
      :L => 90,
      :M => 15,
      :N => 40,
      :O => 10,
      :P => 50,
      :Q => 30,
      :R => 50,
      :S => 30,
      :T => 20,
      :U => 40,
      :V => 50,
      :W => 20,
      :X => 90,
      :Y => 10,
      :Z => 50 
    }

    @free_product_discounts = {
      :EE => "B",
      :FFF => "F",
      :NNN => "M",
      :RRR => "Q",
      :UUUU => "U"
    }

    @multibuy_offers = {
      :AAAAA => :C,
      :AAA => :A,
      :BB => :B,
      :HHHHHHHHHH => :E,
      :HHHHH => :D,
      :KK => :F,
      :PPPPP => :G,
      :QQQ => :H,
      :VV => :I,
      :VVV => :J
    }

    @special_offer_prices = {
      :A => 130,
      :B => 45,
      :C => 200,
      :D => 45,
      :E => 80,
      :F => 150,
      :G => 200,
      :H => 80,
      :I => 90,
      :J => 130
    }
  end

  def checkout(skus)
    return 0 if skus == "";
    return -1 if skus.match(/\W+/)
    return -1 if skus.match(/[a-z]+/)

    skus = order_skus_alphabetically(skus)
    skus = remove_free_products(skus)

    special_offers = ""

    @multibuy_offers.each do |pattern,multibuy_id|      
      skus.scan(pattern.to_s) do
        special_offers += multibuy_id.to_s
      end
      skus.gsub! pattern.to_s, ''
    end

    total = 0

    skus.each_char do |product|
      total += @prices[product.to_sym]
    end

    special_offers.each_char do |special_offer|
      total += @special_offer_prices[special_offer.to_sym]
    end 

    return total
  end

  def order_skus_alphabetically(skus)
    return skus.chars.sort.join
  end

  def remove_free_products(skus)
    @free_product_discounts.each do |match,free_product|
      free_product_count = 0
      skus.scan(match.to_s) do
        free_product_count += 1
      end
      free_product_count.times do
        skus = skus.sub(free_product, '')
      end
    end

    return skus
  end

end
