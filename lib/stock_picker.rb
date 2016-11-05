
def stock_picker(prices_by_day)
  raise TypeError unless prices_by_day.is_a?(Array)
  
  day_pair_profits = {}
  prices_by_day.each_with_index do |price, day|
    prices_by_day[(day + 1)..-1].each_with_index do |following_price, following_day|
      day_pair_profits[[day, (following_day + day + 1)]] = following_price - price
    end
  end
  greatest_profit = day_pair_profits.values.max
  day_pair_profits.key(greatest_profit)
end
