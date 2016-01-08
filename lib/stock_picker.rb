def stock_picker(array)
  raise ArgumentError "Invalid argument" if !array.is_a?(Array)
  raise ArgumentError "Invalid input" if array.any? { |element| !element.is_a?(Fixnum) }

  buy_day = 0
  sell_day = 0
  max_profit = 0
  dates = []
  array.each_with_index do |num, index|
  	buy_day = index 
  	buy_price = num
  	(index+1...array.length).each_with_index do |num2, index2|
  		if num2 - buy_price > max_profit
	  		max_profit = num2 - buy_price
	  		puts max_profit
				dates = [buy_day, index2]
	  	end
  	end
  end

  dates
end
