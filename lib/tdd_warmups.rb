def stock_picker(stocks = [44, 30, 24, 32, 35, 30, 40, 38, 15, 30])
  raise ArgumentError, 'Please enter an array of stock prices' unless stocks.is_a? Array

  max = 0
  max_index = []

  stocks.each_with_index do |stock, index|
    raise ArgumentError, 'Please enter only numbers in the array' unless stock.is_a? Integer
    stocks.size.times do |k|
      next unless stock < stocks[k] && index < k && stocks[k] - stock > max
      max, max_index = stocks[k] - stock, [index, k]
    end
  end

  return max_index
end
