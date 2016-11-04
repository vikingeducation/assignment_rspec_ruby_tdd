class Warmups

  def stock_picker(prices)
    raise "Your input should be an array" unless prices.is_a? Array
    raise "Make sure all prices are numbers" unless prices.all? { |price| price.is_a? Numeric }
  end
end