def stock_picker(stock_prices)
  raise ArgumentError unless stock_prices.is_a?(Array) 
  raise ArgumentError unless stock_prices.length > 1 
  raise ArgumentError unless stock_prices.all?{ |price| price > 0 && price.is_a?(Numeric) }

  best_days = [0, 1]
  profit = stock_prices[1] - stock_prices[0]

  stock_prices.each_with_index do |buying_price, buying_day_index| 
    stock_prices[(buying_day_index + 1)..-1].each_with_index do |selling_price, selling_day_index| 
      if selling_price - buying_price > profit 
        profit = selling_price - buying_price
        best_days = [buying_day_index, buying_day_index + selling_day_index + 1]
      end
    end
  end

  best_days
end

