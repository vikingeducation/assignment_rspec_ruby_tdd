class StockPicker

  def picker(array)
    buy_day = 0
    sell_day = 1
    sum = 0
    best_days = []

    raise ArgumentError if array.length < 2
    raise NameError if array.any? {|price| price < 0}

    while buy_day <= array.length
      buy_price = array[buy_day]

      (buy_day..array.length-2).each do |possible_sell_day|
        sell_price = array[possible_sell_day+1]
        profit = sell_price - buy_price

        if profit > sum
          best_days = buy_day, possible_sell_day+1
          sum = profit

        end
      end
      buy_day += 1
    end

    return best_days
  end


end
