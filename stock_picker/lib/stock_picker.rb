# Creating a stock_picker method
def stock_picker(arr)
	raise ArgumentError, "Not given array" unless arr.is_a?(Array)
	raise ArgumentError, "Invalid Input" unless arr.all?{|input| input.is_a?(Fixnum)}
	raise ArgumentError, "Negative price" unless arr.all?{|input| input >= 0}

	# Initialize variables
	best_set, current_max = [0,0], nil

	# Outer loop
	arr.each_with_index do |price, index|

		# Inner loop
		if index < arr.length-1 # We don't want this loop to run on the last item in arr
			(index+1).upto(arr.length-1) do |second_index|
				current_max = arr[second_index] - arr[index] if current_max.nil?
				if arr[second_index] - arr[index] > current_max
					best_set[0], best_set[1] = index, second_index
					current_max = arr[second_index] - arr[index]
				end
			end
		end
	end
	best_set
end