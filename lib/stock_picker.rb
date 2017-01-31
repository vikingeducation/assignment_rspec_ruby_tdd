# Takes an array of stock prices (prices on days 0, 1, ...) and outputs the most profitable pair of days on which to first buy the stock and then sell the stock, for example:

def stock_picker(stock_prices)
  raise ArgumentError, "Not provided an array" unless stock_prices.is_a?(Array)


  min_day = stock_prices.index(stock_prices.min)


  min = stock_prices[0]
  max = stock_prices[0]
  days = [0,1]
  len = stock_prices.length

  stock_prices.each_with_index do |price, i|
    # If we have found a new minimum stock price and it it less than the last but one day, save the day
    if(price < min && (i < len-2))
      min = price
      days[0] = i

      # # If we find a new minimum day price, the maximum needs to be after this

      max = stock_prices[i+1]
      days[1] = i+1
    end

    # If we have found a new maximum stock price save the day
    if(price > max && (i < len-1))
      max = price
      days[1] = i
    end
  end

  days

end

# stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])
#=> [2, 6]