def stock_picker(arr)
  best_prices = []
  min_index = 0
  max_index = 1
  max_diff = arr[max_index] - arr[min_index]
  arr.each_with_index do |min_price, min_day|
    arr.each_with_index do |max_price , max_day|
      if max_day > min_day
        if max_price - min_price > max_diff
          max_diff = max_price - min_price
          min_index = min_day
          max_index = max_day
        end
      end
    end
  end
  best_prices << min_index
  best_prices << max_index
  best_prices
end
