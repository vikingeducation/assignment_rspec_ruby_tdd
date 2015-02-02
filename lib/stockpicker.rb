def stock_pick(array)
  raise ArgumentError, "illegal input" unless array.is_a?(Array)
  raise ArgumentError, "non-numeric input" unless array.all? { |entry| entry.is_a?(Integer) }
  raise ArgumentError, "negative or zero input" unless array.all? {|entry| entry > 0}

  start = 0
  finish = 0
  current_max = 0

  array.each_with_index do |buy_value, buy_date|
    array[(buy_date+1)..-1].each_with_index do |sell_value, sell_date|
      if (sell_value - buy_value > current_max)
        current_max = (sell_value - buy_value)
        start, finish = buy_date, sell_date+buy_date+1
      end
    end
  end
  [start, finish]
end
