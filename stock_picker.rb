def stock_picker(arr)
  max_profit = { value: 0, buy_day: 0, sell_day: 0};

  arr.each_with_index do |n, i|
    j = i+1
    while (j < arr.size)
      cur_profit = arr[j] - arr[i]
      if max_profit[:value] < cur_profit
        max_profit[:value] = cur_profit
        max_profit[:buy_day] = i
        max_profit[:sell_day] = j
      end
      j += 1
      end
    end
  return [max_profit[:buy_day], max_profit[:sell_day]]
end