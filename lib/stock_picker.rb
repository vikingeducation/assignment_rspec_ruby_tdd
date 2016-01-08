def stock_picker(array)
  raise ArgumentError "Invalid argument" if !array.is_a?(Array)
  raise ArgumentError "Invalid input" if array.any? { |element| !element.is_a?(Fixnum) }

  max_profit = 0
  dates = []

  array.each_with_index do |b_price, b_day|
  	array[b_day+1..-1].each_with_index do |s_price, s_day|
      profit = s_price - b_price
      if profit > max_profit
        max_profit = profit
        dates = [b_day, b_day + 1 + s_day]
      end
  	end
  end

  dates
end
