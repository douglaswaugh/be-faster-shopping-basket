# noinspection RubyUnusedLocalVariable
class Checkout

  def initialize
    @prices = {
      :A => 50 
    }
  end

  def checkout(skus)
    return 0 if skus == "";

    return @prices[skus.to_sym]
  end

end
