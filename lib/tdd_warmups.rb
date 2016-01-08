def stock_picker(array)
  raise ArgumentError if array.size < 2

  buy_index = 0
  sell_index = 1
  max_profit = array[1] - array[0]
  min_price = array[0]
  min_index = 0

  array.each_with_index do |current_price, index|
    next if index == 0

    potential_profit = current_price - min_price

    if potential_profit > max_profit
      max_profit = potential_profit
      buy_index = min_index
      sell_index = index
    end

    if current_price < min_price
      min_price = current_price
      min_index = index
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
