class StockPicker

  def stock_picker(arr)
    if arr == nil || arr.class != Array  || arr.length == 0 
      raise ArgumentError
    end

    largest_difference = 0
    best_days = []
    arr.each_with_index do |x, index|
      counter = index+1
      while counter < arr.size
        if largest_difference < (arr[counter] - x)
          largest_difference = (arr[counter] - x)
          best_days = [index, counter]
        end
        counter += 1
      end
    end
    best_days
  end

end