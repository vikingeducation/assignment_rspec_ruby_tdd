class StockPicker

  def pick(array)
    raise "Array not passed" if not array.is_a? Array
    raise "Array elements should be numeric and positive" if not array.all? {|item| item.is_a? Numeric}
    raise "Array elements should be numeric and positive" if not array.all? {|item| item >= 0}
    raise "Array size shuold be a minimum of 2" if array.length < 2

    result_array = []
    array.each_with_index do |buy, index_buy|
      array.each_with_index do |sell, index_sell|
        if index_buy < index_sell && array[index_buy] < array[index_sell]  
          result_array << index_buy
          result_array << index_sell
          result_array << (array[index_sell] - array[index_buy])
        end
      end
    end
    return final_arr = [result_array[(result_array.index(result_array.max))-2],
     result_array[(result_array.index(result_array.max))-1]]

  end

end