def stock_picker(input)
  raise ArgumentError unless input.is_a?(Array) && input.length > 1
  raise ArgumentError unless input.all? { |item| item.is_a?(Fixnum) }
  buy_day, sell_day = nil, nil
  input.each_with_index do |buy_price, first_day|
    buy_day == nil ?  buy_day = first_day : buy_day
    input.each_with_index do |sell_price, second_day|
      sell_day == nil ? sell_day = second_day : second_day
      if sell_price - buy_price > input[sell_day] - input[buy_day]
        buy_day = first_day
        sell_day = second_day
      end
    end
  end
  raise "There are no profits to be made here" unless input[sell_day] > input[buy_day]
  [buy_day, sell_day]

end

