# noinspection RubyUnusedLocalVariable
class Checkout

  def initialize
    @prices = {
      :A => 50,
      :B => 30,
      :C => 20 
    }
  end

  def checkout(skus)
    return 0 if skus == "";

    return @prices[skus.to_sym]
  end

end
