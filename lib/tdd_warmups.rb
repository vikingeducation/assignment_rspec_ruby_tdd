def stock_picker(array)
  raise ArgumentError if array.class != Array
  profitable_days = {}
  
  array.each_with_index do |element1, index1|
    index1.upto(array.length - 1) do |index2|

      profit = array[index2] - element1
      days = [index1, index2]
      profitable_days[days] = profit
    end
  end
  new_array = []
  #profitable_days.max_by {|days, profit| profit }[0]
  profitable_days.select { |k, v| new_array << k if v == profitable_days.values.max }
  new_array.count == 1 ? new_array.flatten : new_array
end


def anagrams(string, words)
  raise ArgumentError if string.class != String
  raise ArgumentError if words.class != Array
  raise ArgumentError if string.split(" ").length > 1
  words.select {|word|string.split("").sort == word.split("").sort}.map(&:upcase)
    
end