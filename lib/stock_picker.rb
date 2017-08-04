def stock_picker(days)
  raise unless days.is_a?(Array)

  result = []
  profit = 0

  days[0...-1].each_index do |buy_day|
    new_profit, sell_day = max_profit(days, buy_day)

    if new_profit > profit
      profit = new_profit
      result = [buy_day, sell_day]
    end
  end

  result unless profit <= 0
end

def max_profit(days, buy_day)
  price, day = days[(buy_day + 1)..-1].each_with_index.max
  profit = price - days[buy_day]

  [profit, day + buy_day + 1]
end
