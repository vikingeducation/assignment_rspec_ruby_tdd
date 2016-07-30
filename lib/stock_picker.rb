def stock_picker stocks = []
  raise 'Input data should be an array!' unless
  return 'No pairs available!' if stocks.empty? || stocks.sort.reverse == stocks

end
