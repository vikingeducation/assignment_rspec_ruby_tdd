require 'pry'

class StockPicker

	attr_reader :stocks



 def initialize( stocks )

 	@stocks = stocks

 end



 def validate_stocks

 	raise 'Not all numbers' unless @stocks.all? { |x| x.is_a?( Numeric ) }

 	raise 'Not enough stocks' unless @stocks.size > 1


 end


	def stock_picker

		day1 = 0
		day2 = 1
		days_hash = Hash.new(0)

	while day1 < (@stocks.count-2)

		day2 = day1 + 1

		while day2 < (@stocks.count-1) do

			result = (@stocks[day2]-@stocks[day1])

			days_hash[(result)] = ([day1, day2])

			day2 += 1

		end

		day1 += 1

	end

		return days_hash.max[1] if check_best_days( days_hash )

	end







 def check_best_days( arr )


 	if arr.max[0] <= 0
 		raise "No good days"
 	else
 		return true
 	end

 end

end