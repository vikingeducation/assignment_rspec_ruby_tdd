def stock_picker(arr)
  raise ArgumentError, "Input must be an array!" unless arr.is_a? Array 
  raise ArgumentError, "Array must have 2 or more elements!" unless arr.size > 1
  raise ArgumentError, "Array must consist of all integers or floats!" unless arr.all? { |el| el.is_a?(Integer) || el.is_a?(Float) } 
  raise ArgumentError, "Stock prices can't be negative!" unless arr.all? { |el| el >= 0 }

  get_profits = (arr.length - 1).times
    .map { |i| arr.slice((i + 1)..-1).max - arr[i] } 
  
  if get_profits.all? { |profit| profit < 0 }
    puts "No profits to be made!" 
    return nil
  end

  buy_index = get_profits.index(get_profits.max)
  sell_index = arr.index(get_profits.max + arr[buy_index])

  [buy_index, sell_index]

end

