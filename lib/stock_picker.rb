def stock_picker stock_arr
  raise ArgumentError if stock_arr.length < 2 || !stock_arr.is_a?(Array)
  buy_day, sell_day = 0,1
  current_sell = stock_arr[buy_day] - stock_arr[sell_day]

  stock_arr.each_with_index do |buy, buy_index|
    unless buy_index == stock_arr.length-1
      (buy_index+1...stock_arr.length).each do |sell_index|
        sell = stock_arr[sell_index]
        if current_sell > (buy - sell)
          buy_day, sell_day = buy_index, sell_index
          current_sell = buy - sell
        end
      end
    end
  end
  [buy_day, sell_day]
end

stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])
