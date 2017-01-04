# Calculate from an array of stock prices (prices on days 0, 1, ...) the most profitable pair of days on which to first buy and then sell the stock.
# Method. Input array of stock prices whose index represents successive days. Start outer loop from first day in range (earliest day). From there, loop starting from the next day (later day) up to the last day. Calculate profit (= price on later day - price on earlier day). If greater than "highest profit", replace latter by it, and record "buy day" (earlier day) and "sell day" (later day). After completion of this inner loop, go to the next day in the outer loop and start the inner loop again. Once the outer loop has been calculated for the last-day-but-one, stop. (There is no need to continue to the last day since the earlier day has to be at least one day before the later day.) Finally, print out highest profit, buy day and sell day. 
# Days are numbered from 0, not 1.

def stock_picker(prices)
  i = 0
  j = 0
  buy_day = 0
  sell_day = 0
  profit = []
  highest_profit = 0
  puts "prices: #{prices}"
  while i < (prices.length - 1)
    j = i + 1
    while j < prices.length
      profit[i,j] = prices[j] - prices[i]
      if highest_profit < profit[i,j].join.to_i
        highest_profit = profit[i,j].join.to_i
        buy_day = i
        sell_day = j
      end
      j = j + 1
    end
    i = i + 1
  end

  if highest_profit == 0
    puts "No profit achieved"
  else
    puts "Highest profit = #{highest_profit}"
    puts "Purchase on Day #{buy_day}"
    puts "Sale on Day #{sell_day}"
  end

end

# End


# Main program

print "\n"

daily_stock_prices = [35, 25, 30, 43, 55, 35]
stock_picker(daily_stock_prices)
print "\n"

daily_stock_prices = [44, 30, 24, 32, 35, 30, 40, 38, 15]
stock_picker(daily_stock_prices)
print "\n"

daily_stock_prices = [35, 25, 15]
stock_picker(daily_stock_prices)
print "\n"

# End


