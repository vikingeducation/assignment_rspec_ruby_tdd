def stock_picker(input)
  raise ArgumentError unless input.is_a?(Array) && input.length > 1
  raise ArgumentError unless input.all? { |item| item.is_a?(Fixnum) }
  buy_day_pick = 0
  sell_day_pick = 0
  profit = 0
  buy_day = 0
  while buy_day < input.length
    sell_day = buy_day + 1
    while sell_day < input.length
      combo_profit = input[sell_day] - input[buy_day]
      if combo_profit >profit
        profit = combo_profit
        buy_day_pick = buy_day
        sell_day_pick = sell_day
      end
      sell_day += 1
    end
    buy_day += 1
  end
  raise "There are no profits to be made here" unless input[sell_day_pick] > input[buy_day_pick]
  [buy_day_pick, sell_day_pick]
end


def anagrams(string, array)
  raise ArgumentError unless string.is_a?(String) && array.is_a?(Array)
  raise ArgumentError unless array[0].is_a?(String) && array.length == 1
  new_array = array[0].split(', ')
  new_array.select do |word|
    word.chars.sort == string.chars.sort
  end.map { |word| word.upcase }
end
