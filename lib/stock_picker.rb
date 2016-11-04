def stock_picker(stock_prices)
  raise ArgumentError unless stock_prices.is_a?(Array)
  raise 'Please enter two or more days.' unless stock_prices.size >= 2
end
