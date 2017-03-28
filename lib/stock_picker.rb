def stock_picker(prices)
  profit = 0
  days = []
  (prices.length - 1).times do |low|
    (low..prices.length - 1).each do |high|
      value = prices[high] - prices[low]
      if value > profit
        profit = value
        days[0] = low
        days[1] = high
      end
    end
  end
  puts days
end
