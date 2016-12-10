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

    return @prices[skus.to_sym]
  end

end
