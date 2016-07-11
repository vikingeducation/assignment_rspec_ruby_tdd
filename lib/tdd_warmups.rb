def stock_picker(array)
  raise "Cannot pass empty array." if array.empty?
  raise "Cannot pass array with one element." if array.length == 1
  
  max_value = 0
  max_value_index = 0
  min_value_index = 0

  array.each_index do |i|
    j = i
    while j < array.length do
      compare_prices(buffer, array[j])
    end
  end
end

def compare_prices(buffer, current)
  
end

