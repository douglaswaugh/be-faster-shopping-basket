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
    skus.each_char do |product|
      total += @prices[product.to_sym]
    end

    return total
  end

end
