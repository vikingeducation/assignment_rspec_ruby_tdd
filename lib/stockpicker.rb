def stockpicker(prices)
  raise ArgumentError unless prices.is_a?(Array)
  raise ArgumentError unless prices.length > 2
  raise ArgumentError unless prices.all? { |v| v.is_a?(Integer) }

  best_profit = 0
  answer = []

  prices.each_with_index do |value, test_day|
    test_day.upto(prices.length-1) do |compare_day|

      if prices[compare_day] > value
        profit = prices[compare_day] - value
        if profit > best_profit
          best_profit = profit 
          answer = [test_day, compare_day]
        end
      end
      
    end
  end

  answer
end