# stock prices

def stock_picker(stock_prices)

  unless valid_input?(stock_prices)
    raise "Error: invalid argument"
  end

  return 0 if stock_prices.length == 0
  return stock_prices[0] if stock_prices.length == 1

  profit = 0
  pf_day_1, pf_day_2 = 0, 0

  stock_prices.each_with_index do |val_1, day_1|
    stock_prices.each_with_index do |val_2, day_2|
      next if day_2 <= day_1
      if val_2 - val_1 > profit
        profit = val_2 - val_1
        pf_day_1, pf_day_2 = day_1, day_2 
      end
    end
  end

  [pf_day_1, pf_day_2]

end

def valid_input?(arg)

  return false unless arg.is_a?(Array)
  return false unless arg.all? do |item|
    item.is_a?(Integer) || item.is_a?(Float)
  end
  true

end