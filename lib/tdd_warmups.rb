def stock_picker(array)
  raise ArgumentError unless array.size >= 2
  buy_index = 0
  sell_index = 1
  max_profit = array[1] - array[0]

  array.each_index do |earlier_index|
    (earlier_index+1...array.length).each do |later_index|
      potential_profit = array[later_index] - array[earlier_index]

      if potential_profit > max_profit
        max_profit = potential_profit
        buy_index = earlier_index
        sell_index = later_index
      end

    end
  end

  [buy_index, sell_index]
end

def anagrams(string)
  anagram_array = []
  word_key = string.upcase.chars.sort.join
  File.open("/usr/share/dict/words").each_line do |line|
    if line.chomp.upcase.chars.sort.join == word_key
      anagram_array << line.chomp.upcase
    end
  end
  anagram_array.reject{ |word| word.upcase == string.upcase }
end
