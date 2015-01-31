def stock_picker an_array
  if an_array.length < 2
    return nil
  elsif !an_array.kind_of?(Array)
    raise TypeError
  end
  first_index = 0
  second_index = 0
  maximum = 0
  an_array.each_with_index do |first_day_price, first_day|
    an_array.each_with_index do |second_day_price, second_day|
      next if second_day < first_day
      if maximum < (second_day_price - first_day_price)
        maximum = second_day_price - first_day_price
        first_index = first_day
        second_index = second_day
      end
    end
  end
  [first_index, second_index]
end