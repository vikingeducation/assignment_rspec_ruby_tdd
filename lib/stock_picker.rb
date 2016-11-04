def stock_picker(stock_prices)
  raise ArgumentError unless stock_prices.is_a?(Array)
  raise 'Please enter two or more days.' unless stock_prices.size >= 2

  greatest_profit = 0
  buy_sell = []
  (stock_prices.length - 1).times do | day_one |
    ((day_one + 1)..(stock_prices.length - 1)).each do | day_two |
      if (stock_prices[day_two] - stock_prices[day_one]) > greatest_profit
        greatest_profit = stock_prices[day_two] - stock_prices[day_one]
        buy_sell = [day_one, day_two]
      end
    end
  end
  raise "No profit possible" if greatest_profit == 0
  buy_sell
end
