def stock_picker(stocks = [44, 30, 24, 32, 35, 30, 40, 38, 15, 30])
  raise ArgumentError, 'Please enter an array of stock prices'  unless stocks.is_a? Array
  raise ArgumentError, 'Please enter only numbers in the array' unless stocks.all? {|stock| stock.is_a? Numeric}
  raise ArgumentError, 'Stock prices must be positive' unless stocks.all? {|stock| stock >= 0}
  raise "Array must contain a minimum of 2 stock prices" unless stocks.size >= 2
  max = 0
  max_index = []

  stocks.each_with_index do |stock, index|
    stocks.size.times do |k|
      next unless stock < stocks[k] && index < k && stocks[k] - stock > max
      max, max_index = stocks[k] - stock, [index, k]
    end
  end

  return max_index
end
