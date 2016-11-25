
def stock_picker(prices)
  raise "Argument must be an array" unless prices.is_a?(Array)
  most_profitable_days = []
  most_profit = 0
  (0..prices.length - 2).each do |start_day|
    (start_day + 1..prices.length - 1).each do |end_day|
      if prices[end_day] - prices[start_day] > most_profit
        most_profit = prices[end_day] - prices[start_day]
        most_profitable_days[0] = start_day
        most_profitable_days[1] = end_day
      end
    end
  end
  most_profitable_days
end
