def stock_picker stocks = []
  raise 'Input data should be an array!' unless stocks.is_a? Array
  raise 'Input data should be positive!' unless stocks.all? { |price| price > 0 }
  return 'No pairs available!' if stocks.empty? || stocks.sort.reverse == stocks
  pairs = []
  max_difference = 0
  stocks.each_with_index do |buy_price, buy_day|
    stocks.each_with_index do |sell_price, sell_day|
      price_difference = sell_price - buy_price
      if price_difference > max_difference && buy_day < sell_day
        max_difference = price_difference
        pairs[0] = buy_day
        pairs[1] = sell_day
      end
    end
  end
  pairs

end
