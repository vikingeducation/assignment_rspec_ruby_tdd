class Warmups

  def stock_picker(prices)
    validate_stock_input(prices)
    return [0,1]
  end

  def validate_stock_input(prices)
    raise "Your input should be an array" unless prices.is_a? Array
    raise "Make sure all prices are numbers" unless prices.all? { |price| price.is_a? Numeric }
    raise "You need at least two prices" unless prices.length > 1
    raise "All prices must be positive" unless prices.all? { |price| price > 0 }
  end

end