class StockPicker
	def stock_picker(arr)
		raise "Error" unless arr.is_a?(Array)
		return arr[0] if arr.length == 1
	end
end

s = StockPicker.new
s.stock_picker([1,2])