class StockPicker
	def stock_picker(prices)
		raise "Error" unless prices.is_a?(Array)
		return prices[0] if prices.length == 1
		buy_day = nil
		sell_day = nil
    max_price = 0

		prices.each_with_index do |price_a, day_a|
		 prices.each_with_index do |price_b, day_b |	
		 	
		 	current_price = price_b - price_a
		 	
		 	if day_b > day_a && current_price > max_price
		 	max_price = current_price
		 	buy_day, sell_day = day_a, day_b
		  end
     end
    end
    max_price
    buy_day
    sell_day
	end
	
end

s = StockPicker.new
s.stock_picker([1,2,3,4,5])