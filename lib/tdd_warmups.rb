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

  profitable_days.max_by {|days, profit| profit }[0]
      
end


def anagrams(string, words)
  ["RETOOL", "ROOTLE", "TOOLER"]
end