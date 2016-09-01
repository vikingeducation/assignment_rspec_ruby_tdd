def stock_picker(*input)
  raise ArgumentError if !input.is_a?(Array) && input.length < 2
  buy_date = 0
  sell_date = 0
  largest_profit = 0
  input.each_with_index do |buy_price, buy_day|
    input[buy_day + 1..-1].each_with_index do |sell_price, sell_day|
      if (sell_price - buy_price) > largest_profit
        largest_profit = sell_price - buy_price
        buy_date = buy_day + 1
        sell_date = sell_day + buy_date + 1
      end
    end
  end
  return "#{buy_date}, #{sell_date}"
end