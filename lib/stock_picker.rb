def stock_picker(prices)
	raise "Argument must be an array" unless prices.is_a?(Array)
	raise "Not a number" unless prices.all? {|p| p.is_a? Numeric}
	max_profit = max_profit_day_one = max_profit_day_two = 0
	(0...prices.length).each do |i|
		((i + 1)...prices.length).each do |j|
			day_one = prices[i]
			day_two = prices[j]
			current_profit = day_two - day_one
			if current_profit > max_profit
				max_profit = current_profit
				max_profit_day_one = i
				max_profit_day_two = j
			end
		end
	end
	[max_profit_day_one, max_profit_day_two]
end